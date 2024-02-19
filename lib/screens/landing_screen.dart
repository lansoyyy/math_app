import 'package:flutter/material.dart';
import 'package:mathalino/screens/home_screen.dart';
import 'package:mathalino/widgets/button_widget.dart';
import 'package:mathalino/widgets/text_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

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
            TextWidget(
              text: 'MATHEMATICS LEARNER MATERIAL for\nGRADE 4',
              fontSize: 48,
              color: Colors.blue,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 50,
            ),
            ButtonWidget(
              fontSize: 24,
              color: Colors.blue,
              label: 'START',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
