import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

abstract class RecordAudio {
  static final Record _recorder = Record();

  static Future<void> startRecord() async {
    final String cachedPath = (await getTemporaryDirectory()).path;
    if (await _recorder.hasPermission()) {
      await _recorder.start(
        encoder: AudioEncoder.wav,
        path: join(cachedPath, 'recordedAudio.wav'),
      );
    } else {
      await Permission.microphone.request();
      await Permission.storage.request();
      await Permission.manageExternalStorage.request();
    }
  }

  static Future<String> stopRecord() async {
    final String? audioPath = await _recorder.stop();
    log(audioPath!);
    return audioPath;
  }

  static Future<String> getBase64Audio(String audioPath) async {
    final File audioFile = File(audioPath);
    final List<int> fileBytes = await audioFile.readAsBytes();
    final String base64Audio = base64Encode(fileBytes);
    return base64Audio;
  }
}
