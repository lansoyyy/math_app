import 'package:flutter/material.dart';
import 'package:mathalino/screens/pages/multiple_choice_dialog.dart';
import 'package:mathalino/screens/pages/quiz_time_page.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';

class Assessmentpage extends StatefulWidget {
  const Assessmentpage({super.key});

  @override
  State<Assessmentpage> createState() => _AssessmentpageState();
}

class _AssessmentpageState extends State<Assessmentpage> {
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
              TextWidget(
                text: 'Assessments',
                fontSize: 48,
                fontFamily: 'Bold',
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
