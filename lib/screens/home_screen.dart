import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mathalino/screens/pages/assessment_page.dart';
import 'package:mathalino/screens/pages/book_page.dart';
import 'package:mathalino/screens/pages/drills_page.dart';
import 'package:mathalino/screens/pages/settings_page.dart';
import 'package:mathalino/widgets/button_widget.dart';
import 'package:mathalino/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final player = AudioPlayer();
  @override
  initState() {
    playAudio();
    super.initState();
  }

  playAudio() async {
    await player.setAsset('assets/images/math.mp3');

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

  bool show = false;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ani.gif',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    await player.stop();
                    Get.to(() => const BookPage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 3));
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.book,
                          color: Colors.white,
                          size: 100,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: 'Books',
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Bold',
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await player.stop();
                    Get.to(() => const DrillsPage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 3));
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.video_call,
                          color: Colors.white,
                          size: 100,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: 'Drills and Practices',
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Bold',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    await player.stop();
                    Get.to(() => const Assessmentpage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 3));
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.assessment,
                          color: Colors.white,
                          size: 100,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: 'Assessments',
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Bold',
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await player.stop();
                    Get.to(() => const SettingsPage(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 3));
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 100,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: 'Settings',
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Bold',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
