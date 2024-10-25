import 'package:flutter/material.dart';

class ChangepasswordPage extends StatelessWidget {
  const ChangepasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Change Password"),
      ),
    );
  }
}