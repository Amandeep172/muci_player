// import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_player/Pages/playSongPage.dart';
import 'package:ms_player/config/colors.dart';
import 'package:ms_player/controller/cloudSongController.dart';
import 'package:ms_player/controller/songDataController.dart';
import 'package:ms_player/controller/songPlayerController.dart';

class TrendingSongSlider extends StatelessWidget {
  const TrendingSongSlider({super.key});

  @override
  Widget build(BuildContext context) {
    Cloudsongcontroller cloudsongcontroller = Get.put(Cloudsongcontroller());
    Songplayercontroller songplayercontroller = Get.put(Songplayercontroller());
    Songdatacontroller songdatacontroller = Get.put(Songdatacontroller());
    print(
      "🔥 Trending Song List Length: ${cloudsongcontroller.trendingSongList.length}",
    );
    return Obx(() {
      if (cloudsongcontroller.trendingSongList.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      List<Widget> sliderItem =
          cloudsongcontroller.trendingSongList.value
              .map(
                (e) => InkWell(
                  onTap: () {
                    songplayercontroller.playCloudAudio(e);
                    songdatacontroller.findCurrentSongPLayingIndex(e.id!);
                    Get.to(Playsongpage());
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(e.albumArt!),
                        fit: BoxFit.cover,
                      ),
                      color: divColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: divColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.music_video),
                                        SizedBox(width: 10),
                                        Text(
                                          "Trending",
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${e.title}",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${e.artist}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color(0xffFFFF00),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList();
      return CarouselSlider(
        items: sliderItem,
        options: CarouselOptions(
          height: 450,
          viewportFraction: .7,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, value) {},
          scrollDirection: Axis.horizontal,
        ),
      );
    });
  }
}
