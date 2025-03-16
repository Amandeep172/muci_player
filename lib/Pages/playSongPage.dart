import 'package:flutter/material.dart';
import 'package:ms_player/components/SongAndVolume.dart';
import 'package:ms_player/components/playSongHeaderButton.dart';
import 'package:ms_player/components/songControllerButton.dart';
import 'package:ms_player/components/songDetails.dart';
import 'package:ms_player/components/songWave.dart';

class Playsongpage extends StatelessWidget {
  const Playsongpage({super.key});

  @override
  Widget build(BuildContext context) {
    var value = 20.0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Playsongheaderbutton(),
              SizedBox(height: 10),
              Songandvolume(),
              SizedBox(height: 20),
              Songdetails(),
              SizedBox(height: 20),
              Songwave(),
              SizedBox(height: 20),
              Spacer(),
              Songcontrollerbutton(),
            ],
          ),
        ),
      ),
    );
  }
}
