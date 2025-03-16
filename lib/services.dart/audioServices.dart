// import 'dart:typed_data';
// import 'package:web/web.dart' as web;import 'package:audioplayers/audioplayers.dart';

// class AudioService {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   Uint8List? _audioBytes;

//   Future<void> playAudio(Uint8List bytes) async {
//     _audioBytes = bytes;
//     final blob = html.Blob([_audioBytes!]);
//     final url = html.Url.createObjectUrlFromBlob(blob);

//     await _audioPlayer.play(UrlSource(url));
//     html.Url.revokeObjectUrl(url);
//   }

//   void stopAudio() {
//     _audioPlayer.stop();
//   }
// }
