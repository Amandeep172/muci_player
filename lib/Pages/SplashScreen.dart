import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: SvgPicture.asset("icons/music_icon.svg")),
      body: Center(
        child: Icon(Icons.music_note, size: 100, color: Color(0xffFFE3B0)),
      ),
    );
  }
}
