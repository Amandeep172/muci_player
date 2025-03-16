import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_player/model/mySongModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Cloudsongcontroller extends GetxController {
  final storage = Supabase.instance.client.storage;

  RxList<MySongModel> cloudSongList = RxList<MySongModel>([]);
  RxList<MySongModel> trendingSongList = RxList<MySongModel>([]);
  RxBool isCloudsSoundPlaying = false.obs;
  RxString albumUrl = "".obs;

  @override
  void onInit() {
    getCloudSong();
    // TODO: implement onInit
    super.onInit();
  }

  void uplaodSongtoDB() async {
    MySongModel newSong = MySongModel(
      id: 4,
      title: "Maybe my soulmate died",
      artist: "Stephen Sanchez",
      album: "album",
      albumArt: "https://i.ytimg.com/vi/S_KUxsFPpp8/maxresdefault.jpg",
      data:
          "https://cfyiqoxucgnppzkctjir.supabase.co/storage/v1/object/sign/music/Maybe%20My%20Soulmate%20Died%20-%20iamnotshane.m4a?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJtdXNpYy9NYXliZSBNeSBTb3VsbWF0ZSBEaWVkIC0gaWFtbm90c2hhbmUubTRhIiwiaWF0IjoxNzQyMDQ2OTk4LCJleHAiOjE3NzM1ODI5OTh9.-Zoi6gLAkSi-m-J8nbg6T-CwHl4G2_MmpRujkxlBsEE",
    );
    // await storage.collection("songs").add(newSong.toJson());
    final response = await Supabase.instance.client
        .from('trending')
        .insert(newSong.toJson());
    if (response == null) {
      print("✅ Song uploaded successfully!");
    } else {
      print("⚠️ Supabase Response: $response");
    }
  }

  void getCloudSong() async {
    cloudSongList.clear();

    final response = await Supabase.instance.client.from('songs').select();

    if (response != null) {
      for (var element in response) {
        cloudSongList.add(MySongModel.fromJson(element));
      }
    }

    final responses = await Supabase.instance.client.from('trending').select();

    if (responses != null) {
      for (var element in responses) {
        trendingSongList.add(MySongModel.fromJson(element));
      }
    }

    print("✅ Songs fetched: ${cloudSongList.length}");
  }
}
