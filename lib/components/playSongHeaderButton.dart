import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_player/config/colors.dart';

class Playsongheaderbutton extends StatelessWidget {
  const Playsongheaderbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: divColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Icon(Icons.arrow_back_ios)),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: divColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Icon(Icons.settings)),
        ),
      ],
    );
  }
}
