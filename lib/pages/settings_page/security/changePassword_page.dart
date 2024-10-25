import 'package:flutter/material.dart';

class ChangepasswordPage extends StatelessWidget {
  const ChangepasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Change Password"),
      ),
    );
  }
}