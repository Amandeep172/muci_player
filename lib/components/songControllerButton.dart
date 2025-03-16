import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_player/config/colors.dart';
import 'package:ms_player/controller/songDataController.dart';
import 'package:ms_player/controller/songPlayerController.dart';

class Songcontrollerbutton extends StatelessWidget {
  const Songcontrollerbutton({super.key});

  @override
  Widget build(BuildContext context) {
    Songplayercontroller songplayercontroller = Get.put(Songplayercontroller());
    Songdatacontroller songdatacontroller = Get.put(Songdatacontroller());
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${songplayercontroller.currentTime}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                child: Obx(
                  () => Slider(
                    value: songplayercontroller.sliderValue.value.clamp(
                      0.0,
                      songplayercontroller.sliderValue.value,
                    ),
                    onChanged: (value) {
                      songplayercontroller.sliderValue.value = value;
                      Duration songPositon = Duration(seconds: value.toInt());
                      songplayercontroller.changeSongSlider(songPositon);
                    },
                    min: 0,
                    max: songplayercontroller.sliderMaxValue.value,
                  ),
                ),
              ),
              Text(
                "${songplayercontroller.totalTime}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                songdatacontroller.playPreviousSong();
              },
              child: Icon(Icons.skip_previous, size: 50),
            ),
            SizedBox(width: 20),
            Obx(
              () =>
                  songplayercontroller.isPlaying.value
                      ? InkWell(
                        onTap: () {
                          songplayercontroller.pausePlaying();
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.pause_circle_filled_rounded,
                              size: 50,
                            ),
                          ),
                        ),
                      )
                      : InkWell(
                        onTap: () {
                          songplayercontroller.resumePlaying();
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.play_circle_filled_rounded,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                songdatacontroller.playNextSong();
              },
              child: Icon(Icons.skip_next, size: 50),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                songplayercontroller.playrandomSong();
              },
              child: Obx(
                () => Icon(
                  Icons.shuffle,
                  size: 50,
                  color:
                      songplayercontroller.isShuffled.value
                          ? primaryColor
                          : labelColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                songplayercontroller.setLoopSong();
              },
              child: Obx(
                () => Icon(
                  Icons.repeat,
                  size: 50,
                  color:
                      songplayercontroller.isLoop.value
                          ? primaryColor
                          : labelColor,
                ),
              ),
            ),
            Icon(Icons.playlist_add, size: 50),
            Icon(Icons.favorite_outline, size: 50),
          ],
        ),
      ],
    );
  }
}
