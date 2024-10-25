import 'package:flutter/material.dart';

class PrivacypolicyPage extends StatelessWidget {
  const PrivacypolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Privacy Policy"),
      ),
    );
  }
}