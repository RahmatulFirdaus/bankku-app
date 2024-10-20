import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroScreenpage extends StatelessWidget {
  const IntroScreenpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 255, 255, 255),
        Colors.blue.shade200
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SafeArea(
          child: Center(
        child: Column(
          children: [
            SvgPicture.asset('assets/images/vector02.svg', width: 500,),
            Text("bang")
          ],
        ),
      )),
    ));
  }
}
