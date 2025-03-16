import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_player/config/colors.dart';
import 'package:ms_player/controller/songPlayerController.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Songandvolume extends StatelessWidget {
  const Songandvolume({super.key});

  @override
  Widget build(BuildContext context) {
    Songplayercontroller songplayercontroller = Get.put(Songplayercontroller());
    return Obx(
      () => SfRadialGauge(
        animationDuration: 1,
        enableLoadingAnimation: true,
        axes: [
          RadialAxis(
            useRangeColorForAxis: true,
            startAngle: 0,
            endAngle: 180,
            canRotateLabels: false,
            interval: 10,
            isInversed: true,
            maximum: 1,
            minimum: 0,
            showAxisLine: true,
            showLabels: false,
            showTicks: false,
            ranges: [
              GaugeRange(
                startValue: 0,
                endValue: songplayercontroller.volumeLabel.value,
                color: primaryColor,
              ),
            ],
            pointers: [
              MarkerPointer(
                color: primaryColor,
                borderWidth: 10,
                value: songplayercontroller.volumeLabel.value,
                onValueChanged: (valuee) {
                  songplayercontroller.changVolume(valuee);
                },
                enableAnimation: true,
                enableDragging: true,
                markerType: MarkerType.circle,
                markerWidth: 20,
                markerHeight: 20,
              ),
            ],
            annotations: [
              GaugeAnnotation(
                horizontalAlignment: GaugeAlignment.center,
                widget: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    image: DecorationImage(
                      image:
                          songplayercontroller.isCloudSoundPlaying.value
                              ? NetworkImage(
                                songplayercontroller.albumUrl.value,
                              )
                              : AssetImage("icons/cover_art.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: divColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
