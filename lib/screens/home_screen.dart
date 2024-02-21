import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mathalino/screens/pages/assessment_page.dart';
import 'package:mathalino/screens/pages/book_page.dart';
import 'package:mathalino/screens/pages/drills_page.dart';
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
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ani.gif',
            ),
            const SizedBox(
              height: 25,
            ),
            TextWidget(
              text: 'HOME',
              fontSize: 48,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 25,
            ),
            ButtonWidget(
              fontSize: 24,
              color: Colors.blue,
              label: 'BOOKS',
              onPressed: () async {
                await player.stop();
                Get.to(() => const BookPage(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 3));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              fontSize: 24,
              color: Colors.blue,
              label: 'DRILLS AND PRACTICES',
              onPressed: () async {
                await player.stop();
                Get.to(() => const DrillsPage(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 3));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              fontSize: 24,
              color: Colors.blue,
              label: 'ASSESSMENT',
              onPressed: () async {
                await player.stop();
                Get.to(() => const Assessmentpage(),
                    transition: Transition.circularReveal,
                    duration: const Duration(seconds: 3));
              },
            ),
          ],
        ),
      ),
    );
  }
}
