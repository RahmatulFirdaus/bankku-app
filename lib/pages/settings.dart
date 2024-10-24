import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.menu),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  size: 26,
                ),
              ),
            )
          ],
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          toolbarHeight: 90,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255), // Warna transparan putih
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("General", style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.5)),)
            ]
          )
        ));
  }
}
