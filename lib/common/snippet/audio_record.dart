/*
* <uses-permission android:name="android.permission.RECORD_AUDIO" />
<!-- Optional, you'll have to check this permission by yourself. -->
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
*
* // Import package
import 'package:record/record.dart';

final record = Record();

// Check and request permission
if (await record.hasPermission()) {
  // Start recording
  await record.start(
    path: 'aFullPath/myFile.m4a',
    encoder: AudioEncoder.aacLc, // by default
    bitRate: 128000, // by default
    sampleRate: 44100, // by default
  );
}

// Get the state of the recorder
bool isRecording = await record.isRecording();

// Stop recording
await record.stop();
* */