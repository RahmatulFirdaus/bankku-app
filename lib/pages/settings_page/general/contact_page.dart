import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Dev : Rahmatul Firdaus",
                  style: TextStyle(fontSize: 18), 
                ),
                Divider(),
                Text(
                  "Github : https://github.com/RahmatulFirdaus",
                  style: TextStyle(fontSize: 16), 
                ),
                Text(
                  "Email: rahmatulfirdaus30@gmail.com",
                  style: TextStyle(fontSize: 16), 
                ),
                Text(
                  "Instagram : @ellenyedija",
                  style: TextStyle(fontSize: 16), 
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
