import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_player/controller/cloudSongController.dart';

class Demopage extends StatelessWidget {
  const Demopage({super.key});

  @override
  Widget build(BuildContext context) {
    Cloudsongcontroller cloudsongcontroller = Get.put(Cloudsongcontroller());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            cloudsongcontroller.getCloudSong();
          },
          child: Text("hello databas"),
        ),
      ),
    );
  }
}
