import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mathalino/screens/pages/video_page.dart';
import 'package:path_provider/path_provider.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import '../home_screen.dart';

class DrillsPage extends StatefulWidget {
  const DrillsPage({super.key});

  @override
  State<DrillsPage> createState() => _DrillsPageState();
}

class _DrillsPageState extends State<DrillsPage> {
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
                    text: 'Drills and\nPractices',
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
              ButtonWidget(
                fontSize: 24,
                color: Colors.blue,
                label: '1st Quarter',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoPage(
                            video: 'assets/images/1.mp4',
                          )));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                fontSize: 24,
                color: Colors.blue,
                label: '2nd Quarter',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoPage(
                            video: 'assets/images/2.mp4',
                          )));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                fontSize: 24,
                color: Colors.blue,
                label: '3rd Quarter',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoPage(
                            video: 'assets/images/3.mp4',
                          )));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                fontSize: 24,
                color: Colors.blue,
                label: '4th Quarter',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoPage(
                            video: 'assets/images/4.mp4',
                          )));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                fontSize: 14,
                color: Colors.blue,
                label: 'Adding and Subtracting\nDissimilar Fraction',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
