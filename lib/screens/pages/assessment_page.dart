import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mathalino/screens/pages/multiple_choice_dialog.dart';
import 'package:mathalino/screens/pages/quiz_time_page.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import '../home_screen.dart';

class Assessmentpage extends StatefulWidget {
  const Assessmentpage({super.key});

  @override
  State<Assessmentpage> createState() => _AssessmentpageState();
}

class _AssessmentpageState extends State<Assessmentpage> {
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
              fit: BoxFit.cover),
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
                    text: 'Assessments',
                    fontSize: 42,
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
                label: 'Multiple Choice',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MultipleChoicePage()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                fontSize: 24,
                color: Colors.blue,
                label: 'Quiz Time',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QuizPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
