import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:id_camp_final_project/pages/intro_screen.dart';

class Openingpage extends StatefulWidget {
  const Openingpage({super.key});

  @override
  State<Openingpage> createState() => _OpeningpageState();
}

class _OpeningpageState extends State<Openingpage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => IntroScreenpage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color.fromARGB(255, 255, 255, 255), Colors.blue.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Center(
        child: AnimatedTextKit(animatedTexts: [
          TypewriterAnimatedText(
            'BANK-KU',
            textStyle: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
            speed: Duration(milliseconds: 340),
          ),
        ]),
      ),
    ));
  }
}
