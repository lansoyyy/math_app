import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

import 'package:screen_brightness/screen_brightness.dart';
import '../../widgets/text_widget.dart';
import '../home_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _DrillsPageState();
}

class _DrillsPageState extends State<SettingsPage> {
  Future<void> downloadAsset(String assetName, String fileName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String savePath = '${appDocDir.path}/$fileName';

    ByteData data = await rootBundle.load(assetName);
    List<int> bytes = data.buffer.asUint8List();

    await File(savePath).writeAsBytes(bytes);
  }

  final player = AudioPlayer();
  @override
  initState() {
    playAudio();
    super.initState();
  }

  playAudio() async {
    await player.setAsset('assets/images/happy.mp3');

    await player.play();
    await player.setVolume(1);
  }

  stopAudio() async {
    await player.stop();
  }

  @override
  void dispose() {
    stopAudio();

    player.dispose();
    super.dispose();
  }

  double val = 0;
  double val2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                'assets/images/back.png',
              ),
              opacity: 125,
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      await player.stop();
                      Get.to(() => const HomeScreen(),
                          transition: Transition.circularReveal,
                          duration: const Duration(seconds: 3));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  TextWidget(
                    text: 'Settings',
                    fontSize: 48,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Volume',
                fontSize: 24,
                fontFamily: 'Bold',
              ),
              Slider(
                value: val,
                onChanged: (value) async {
                  await FlutterVolumeController.setVolume(value);

                  setState(() {
                    val = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Brightness',
                fontSize: 24,
                fontFamily: 'Bold',
              ),
              Slider(
                value: val2,
                onChanged: (value) async {
                  setBrightness(value);
                  setState(() {
                    val2 = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }
}
