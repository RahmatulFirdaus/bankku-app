import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  String fullName = "Rahmatul Firdaus";
  String email = "rahmatulfirdaus30@gmail.com";
  String phoneNumber = "08xxxxxxxxxx";
  String day = "00";
  String month = "00";
  String year = "0000";
  String joinDate = "00-00-0000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Edit Profile'),
          centerTitle: true,
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/profile.jpg",
                    width: 150,
                  )),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Rahmatul Firdaus",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Multi-platform Developer",
                style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Full Name", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.4))),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person_outline, color: Colors.black.withOpacity(0.6), size: 20),
                          const SizedBox(width: 12),
                          Text(
                            fullName,
                            style: const TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fitur Belum Tersedia")));
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text("Email Address", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.4))),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.email_outlined, color: Colors.black.withOpacity(0.6), size: 20),
                          const SizedBox(width: 12),
                          Text(
                            email,
                            style: const TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fitur Belum Tersedia")));
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text("Phone Number", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.4))),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.phone_outlined, color: Colors.black.withOpacity(0.6), size: 20),
                          const SizedBox(width: 12),
                          Text(
                            phoneNumber,
                            style: const TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fitur Belum Tersedia")));
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text("Birth Date", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.4))),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(day, style: const TextStyle(fontSize: 16, color: Colors.black87)),
                          const SizedBox(width: 8),
                          Text(month, style: const TextStyle(fontSize: 16, color: Colors.black87)),
                          const SizedBox(width: 8),
                          Text(year, style: const TextStyle(fontSize: 16, color: Colors.black87)),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fitur Belum Tersedia")));
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    "Joined $joinDate",
                    style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.4)),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
