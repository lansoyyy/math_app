import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  @override
  void initState() {
    super.initState();
  }

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (!show) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: const Center(
                child: Text(
                  'Welcome Student!',
                  style: TextStyle(fontFamily: 'Bold'),
                ),
              ),
              btnOkOnPress: () {
                setState(() {
                  show = true;
                });
              },
            ).show();
          });
        }
        return Container(
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
                onPressed: () {
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
                onPressed: () {
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
                onPressed: () {
                  Get.to(() => const Assessmentpage(),
                      transition: Transition.circularReveal,
                      duration: const Duration(seconds: 3));
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
