import 'package:flutter/material.dart';
import 'package:mathalino/screens/pages/book_page.dart';
import 'package:mathalino/widgets/button_widget.dart';
import 'package:mathalino/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              text: 'HOME',
              fontSize: 48,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 50,
            ),
            ButtonWidget(
              fontSize: 24,
              color: Colors.blue,
              label: 'BOOKS',
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BookPage()));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              fontSize: 24,
              color: Colors.blue,
              label: 'DRILLS AND PRACTICES',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              fontSize: 24,
              color: Colors.blue,
              label: 'ASSESSMENT',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
