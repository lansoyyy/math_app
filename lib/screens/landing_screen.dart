import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mathalino/screens/home_screen.dart';
import 'package:mathalino/widgets/button_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/MathTALINO 1.jpg',
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                elevation: 50,
                child: ButtonWidget(
                  fontSize: 24,
                  color: Colors.blue,
                  label: 'START',
                  onPressed: () {
                    Get.off(() => const HomeScreen(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 5));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
