import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_player/controller/songPlayerController.dart';

class Songdetails extends StatelessWidget {
  const Songdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Songplayercontroller songplayercontroller = Get.put(Songplayercontroller());
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.play_circle),
            SizedBox(width: 10),
            Text("210 plays", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        SizedBox(height: 10),
        //when overflow from side
        // Flexible(
        // child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Obx(
                () => Text(
                  "${songplayercontroller.songTitle.value}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            SizedBox(width: 200),
            // Icon(Icons.favorite_outline),
            Icon(Icons.download_for_offline, size: 25),
          ],
        ),
        // ),
        Obx(
          () => Row(
            children: [
              SizedBox(width: 10),
              Text(
                "${songplayercontroller.songArtist.value}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
