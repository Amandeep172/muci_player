import 'package:flutter/material.dart';

class Songpageheader extends StatelessWidget {
  const Songpageheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.music_note, size: 60, color: Color(0xffFFE3B0)),
        SizedBox(width: 5),
        Text(
          "Music ",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
