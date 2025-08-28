import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF16213E),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              FaIcon(FontAwesomeIcons.futbol, color: Colors.white, size: 30),
              SizedBox(width: 10),
              Text(
                'Lucky Match',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        body: const MyGameBody(),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFF16213E),
          child: SizedBox(
            height: 35,
            child: Center(
              child: Text(
                '© 2025 Ziad Eltokhy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Edu',
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class MyGameBody extends StatefulWidget {
  const MyGameBody({super.key});

  @override
  State<MyGameBody> createState() => _MyGameBodyState();
}

class _MyGameBodyState extends State<MyGameBody> {
  int leftImageNum = 1;
  int rightImageNum = 2;
  int counter = 0; // start at 0 attempts
  final Random _random = Random();
  final int maxImages = 12;

  String message = "حاول"; // initial text
  void changeImage() {
    leftImageNum = _random.nextInt(maxImages) + 1;
    rightImageNum = _random.nextInt(maxImages) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "أختبر حظك",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
               textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildImageButton(() {
                  setState(() {
                    changeImage();
                    if ( message == "أدفن نفسك يسطا\nأنا مشفتش أوحش من كده") {
                      leftImageNum = 1;
                      rightImageNum = 2;
                      counter = 0;
                      message = "حاول مرة أخري";
                    } else {
                      counter++;
                    }
                    _updateMessage();
                  });
                }, leftImageNum),
                const SizedBox(width: 10),
                buildImageButton(() {
                  setState(() {
                    changeImage();
                    if ( message == "أدفن نفسك يسطا\nأنا مشفتش أوحش من كده") {
                      leftImageNum = 1;
                      rightImageNum = 2;
                      counter = 0;
                      message = "حاول مرة أخري";
                    } else {
                      counter++;
                    }
                    _updateMessage();
                  });
                }, rightImageNum),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "عدد المحاولات: $counter",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Function to update message
  void _updateMessage() {
    if (leftImageNum == rightImageNum) {
       message = "أدفن نفسك يسطا\nأنا مشفتش أوحش من كده";
    } else {
      message = "حاول مرة أخري"; // try again
    }
  }

  Widget buildImageButton(VoidCallback onPressed, int imageNum) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Image.asset('images/Austria - Bundesliga/$imageNum.webp'),
      ),
    );
  }
}
