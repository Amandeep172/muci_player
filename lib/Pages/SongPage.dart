import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ms_player/Pages/playSongPage.dart';
import 'package:ms_player/components/songControllerButton.dart';
import 'package:ms_player/components/songTile.dart';
import 'package:ms_player/components/song_header.dart';
import 'package:ms_player/components/trending.dart';
import 'package:ms_player/config/colors.dart';
import 'package:ms_player/controller/cloudSongController.dart';
import 'package:ms_player/controller/songDataController.dart';
import 'package:ms_player/controller/songPlayerController.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Songpage extends StatelessWidget {
  const Songpage({super.key});

  @override
  Widget build(BuildContext context) {
    Songdatacontroller songdatacontroller = Get.put(Songdatacontroller());
    Songplayercontroller songplayercontroller = Get.put(Songplayercontroller());
    Cloudsongcontroller cloudsongcontroller = Get.put(Cloudsongcontroller());
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Songpageheader(),
                SizedBox(height: 20),
                TrendingSongSlider(),
                SizedBox(height: 20),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          songdatacontroller.isDeviceSong.value = false;
                        },
                        child: Text(
                          "Cloud Song",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            color:
                                songdatacontroller.isDeviceSong.value
                                    ? labelColor
                                    : primaryColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          songdatacontroller.isDeviceSong.value = true;
                        },
                        child: Text(
                          "Device Song",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            color:
                                songdatacontroller.isDeviceSong.value
                                    ? primaryColor
                                    : labelColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () =>
                      songdatacontroller.isDeviceSong.value
                          ? Column(
                            children:
                                songdatacontroller.localSongList.value
                                    .map(
                                      (e) => SongTile(
                                        onPress: () {
                                          songplayercontroller.playLocalAudio(
                                            e,
                                          );
                                          songdatacontroller
                                              .findCurrentSongPLayingIndex(
                                                e.id,
                                              );
                                          Get.to(Playsongpage());
                                        },
                                        songName: e.title,
                                      ),
                                    )
                                    .toList(),
                          )
                          : Column(
                            children:
                                cloudsongcontroller.cloudSongList.value
                                    .map<Widget>(
                                      (e) => SongTile(
                                        onPress: () {
                                          songplayercontroller.playCloudAudio(
                                            e,
                                          );
                                          songdatacontroller
                                              .findCurrentSongPLayingIndex(
                                                e.id!,
                                              );
                                          Get.to(Playsongpage());
                                        },
                                        songName: e.title!,
                                      ),
                                    )
                                    .toList(),
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
