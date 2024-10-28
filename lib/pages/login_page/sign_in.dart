import 'package:flutter/material.dart';
import 'package:id_camp_final_project/pages/get_x_controller.dart';
import 'package:id_camp_final_project/pages/login_page/sign_up.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  var email = "Admin";
  var password = "Admin123";
  bool _passwordVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // Tambahkan Center
                child: Container(
                  constraints: const BoxConstraints(
                      maxWidth: 500), // untuk membatasi lebar maksimal
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: _mainValue(context),
                ),
              ),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 255, 255, 255),
                Colors.blue.shade200
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: SafeArea(
              child: _mainValue(context)
            ),
          );
        }
      }),
    );
  }

  Column _mainValue(BuildContext context) {
    return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text("Email Address",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.5))),
                    const SizedBox(height: 8),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: email,
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Password",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.5))),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: password,
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(_passwordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (emailController.text.isEmpty &&
                              passwordController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please enter your email and password",
                                textColor: Colors.white,
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 17, 0),
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                webPosition: "center",
                                webBgColor: "white",
                                toastLength: Toast.LENGTH_LONG);
                          } else if (emailController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please enter your email",
                                textColor: Colors.white,
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 17, 0),
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                webPosition: "center",
                                webBgColor: "white",
                                toastLength: Toast.LENGTH_LONG);
                          } else if (passwordController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please enter password",
                                textColor: Colors.white,
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 17, 0),
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                webPosition: "center",
                                webBgColor: "white",
                                toastLength: Toast.LENGTH_LONG);
                          } else if (emailController.text == "Admin" &&
                              passwordController.text == "Admin123") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Getxcontrollerpage()));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Invalid email or password",
                                textColor: Colors.white,
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 17, 0),
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                webPosition: "center",
                                webBgColor: "white",
                                toastLength: Toast.LENGTH_LONG);
                          }
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.blue.withOpacity(0.8)),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const Signup();
                              },
                            ));
                          },
                          child: const Text("Sign Up"),
                        )
                      ],
                    )
                  ],
                );
  }
}
