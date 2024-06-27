import 'package:flutter_tts/flutter_tts.dart';

Future<void> speak(
    {required String statements,
    double? speedRate,
    required String locale}) async {
  final FlutterTts flutterTts = FlutterTts();
  await flutterTts.setLanguage(locale);
  await flutterTts.setSpeechRate(speedRate ?? 0.5);
  await flutterTts.setPitch(1.0);
  await flutterTts.speak(statements);
}
