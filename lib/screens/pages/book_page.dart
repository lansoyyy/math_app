import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mathalino/screens/home_screen.dart';
import 'package:mathalino/widgets/toast_widget.dart';
import 'package:path_provider/path_provider.dart';

import '../../widgets/text_widget.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
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
                    text: 'Book',
                    fontSize: 48,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    String assetName = 'assets/images/bookfile.pdf';
                    String fileName = 'bookfile.pdf';
                    await downloadAsset(assetName, fileName);

                    showToast('Book downloaded!');
                  } catch (e) {
                    showToast(e);
                  }
                },
                child: Image.asset(
                  'assets/images/book.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
