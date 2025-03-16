import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ms_player/Pages/SongPage.dart';
import 'package:ms_player/Pages/SplashScreen.dart';
import 'package:ms_player/Pages/demoPage.dart';
import 'package:ms_player/Pages/playSongPage.dart';
import 'package:ms_player/components/SongAndVolume.dart';
import 'package:ms_player/components/playSongHeaderButton.dart';
import 'package:ms_player/components/songControllerButton.dart';
import 'package:ms_player/config/theme.dart';
import 'package:ms_player/controller/cloudSongController.dart';
import 'package:ms_player/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://cfyiqoxucgnppzkctjir.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNmeWlxb3h1Y2ducHB6a2N0amlyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDIwMjg1NjcsImV4cCI6MjA1NzYwNDU2N30.2yy_H0Z-P2wSrHSQAipFcGvS3_efuUvwTPq4gjVr0kQ',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: darkTheme,
      home: const Songpage(),
    );
  }
}
