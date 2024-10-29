import 'package:flutter/material.dart';
import 'package:id_camp_final_project/pages/get_x_controller.dart';
import 'package:id_camp_final_project/pages/login_page/sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        // resizeToAvoidBottomInset: false,
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color.fromARGB(255, 255, 255, 255),
                  Colors.blue.shade200
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: SafeArea(
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: _mainValue(context),
                  ),
                ),
              ),
            );
          } else {
            return Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 255, 255, 255),
                    Colors.blue.shade200
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: SafeArea(child: _mainValue(context)));
          }
        }));
  }

  SingleChildScrollView _mainValue(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.3),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 45,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text("Fullname",
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.5))),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(22, 0, 23, 0),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(
                    Icons.person_outline,
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text("Phone Number",
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.5))),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(22, 0, 23, 0),
              child: TextField(
                controller: phoneNumber,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(
                    Icons.call_rounded,
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text("Email Adrress",
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.5))),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(22, 0, 23, 0),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Text("Password",
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.5))),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(22, 0, 23, 0),
            child: TextFormField(
              controller: password,
              //_passwordVisible bernilai true
              obscureText: _passwordVisible,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        //ketika di klik, maka nilai variabel berubah dari true ke false
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    //jika passwordVisible bernilai true maka icon yang muncul adalah visibility_off_outlined, jika false maka icon yang muncul adalah remove_red_eye_outlined
                    icon: Icon(_passwordVisible
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined),
                  )),
            )),
          const SizedBox(
            height: 45,
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 22),
            child: ElevatedButton(
              onPressed: () {
                if (username.text.isEmpty ||
                    phoneNumber.text.isEmpty ||
                    email.text.isEmpty ||
                    password.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Please fill all fields",
                      gravity: ToastGravity.BOTTOM,
                      textColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 253, 17, 0),
                      toastLength: Toast.LENGTH_LONG,
                      webBgColor: "red",
                      webPosition: "center");
                } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const Getxcontrollerpage();
                    },
                  ));
                }
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
                backgroundColor:
                    WidgetStatePropertyAll(Colors.blue.withOpacity(0.8)),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const Signinpage();
                      },
                    ));
                  },
                  child: const Text("Sign In"),
                )
              ])
            ],
          ), 
        ],
      ),
    );
  }
}
