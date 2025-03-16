import 'package:get/get.dart';
import 'package:ms_player/controller/songPlayerController.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Songdatacontroller extends GetxController {
  Songplayercontroller songplayercontroller = Get.put(Songplayercontroller());
  final audioQuery = OnAudioQuery();
  RxList<SongModel> localSongList = <SongModel>[].obs;
  RxBool isDeviceSong = false.obs;
  RxInt currentSongPLayingIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    storagePermission();
  }

  void getLocalSongs() async {
    localSongList.value = await audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );
  }

  void storagePermission() async {
    try {
      var perm = await Permission.storage.request();
      if (perm.isGranted) {
        print('Permission Granted');
        getLocalSongs();
      } else {
        print('Permission Denied');
        await Permission.storage.request();
      }
    } catch (ex) {
      print(ex);
    }
  }

  void findCurrentSongPLayingIndex(int songId) {
    var index = 0;
    localSongList.forEach((e) {
      if (e.id == songId) {
        currentSongPLayingIndex.value = index;
      }
      index++;
    });
    print(currentSongPLayingIndex);
    print(songId);
  }

  void playNextSong() {
    int songListLen = localSongList.length;
    currentSongPLayingIndex.value = currentSongPLayingIndex.value + 1;
    if (currentSongPLayingIndex.value + 1 < songListLen) {
      currentSongPLayingIndex.value += 1;
      SongModel nextSong = localSongList[currentSongPLayingIndex.value];
      print("🎵 Playing Next Song: ${nextSong.title}");
      songplayercontroller.playLocalAudio(nextSong);
    } else {
      print("🚨 No more songs to play!");
    }
  }

  void playPreviousSong() {
    int songListLen = localSongList.length;
    print(currentSongPLayingIndex);
    if (currentSongPLayingIndex.value != 0) {
      currentSongPLayingIndex.value = currentSongPLayingIndex.value - 1;
      if (currentSongPLayingIndex.value > songListLen) {
        SongModel nextSong = localSongList[currentSongPLayingIndex.value];
        songplayercontroller.playLocalAudio(nextSong);
      }
    }
  }
}
