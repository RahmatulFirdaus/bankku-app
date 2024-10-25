import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangepasswordPage extends StatefulWidget {
  const ChangepasswordPage({super.key});

  @override
  State<ChangepasswordPage> createState() => _ChangepasswordPageState();
}

class _ChangepasswordPageState extends State<ChangepasswordPage> {
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool isNewPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Change Password"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text("Current Password",
                    style: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(0.3))),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(22, 0, 23, 0),
                child: TextField(
                  controller: currentPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text("New Password",
                    style: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(0.3))),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(22, 0, 23, 0),
                child: TextField(
                  controller: newPassword,
                  obscureText: !isNewPasswordVisible,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isNewPasswordVisible = !isNewPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isNewPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text("Confirm New Password",
                    style: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(0.3))),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(22, 0, 23, 0),
                child: TextField(
                  controller: confirmPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 8),
                child: Text("Both Passwords Must Match",
                    style: TextStyle(
                        fontSize: 13, color: Colors.black.withOpacity(0.3))),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 22),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentPassword.text.isEmpty ||
                        newPassword.text.isEmpty ||
                        confirmPassword.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: "Please fill all fields",
                        gravity: ToastGravity.BOTTOM,
                        textColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 253, 17, 0),
                        toastLength: Toast.LENGTH_LONG,
                      );
                    } else if (newPassword.text != confirmPassword.text) {
                      Fluttertoast.showToast(
                        msg: "Passwords do not match",
                        gravity: ToastGravity.BOTTOM,
                        textColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 253, 17, 0),
                        toastLength: Toast.LENGTH_LONG,
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: "Password changed successfully",
                        gravity: ToastGravity.BOTTOM,
                        textColor: Colors.white,
                        backgroundColor: Colors.green,
                        toastLength: Toast.LENGTH_LONG,
                      );
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  child: const Text(
                    "Change Password",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
