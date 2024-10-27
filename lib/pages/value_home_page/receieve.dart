import 'package:flutter/material.dart';

class ReceievePage extends StatelessWidget {
  const ReceievePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Receive Money",
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ));
  }
}
