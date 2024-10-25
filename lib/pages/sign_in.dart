import 'package:flutter/material.dart';
import 'package:id_camp_final_project/pages/get_x_controller.dart';
import 'package:id_camp_final_project/pages/sign_up.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 255, 255, 255),
            Colors.blue.shade200
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
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
                  "Sign In",
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
                child: Text("Email Adress",
                    style: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(0.5))),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(22, 0, 23, 0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: email,
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                      prefixIcon: const Icon(
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
                    controller: passwordController,
                    //_passwordVisible bernilai true
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
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: ElevatedButton(
                  onPressed: () {
                    //validasi saat email dan password kosong
                    if (emailController.text == "" &&
                        passwordController.text == "") {
                      Fluttertoast.showToast(
                          msg: "Please enter your email and password",
                          textColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 255, 17, 0), //warna bg android
                          gravity: ToastGravity.BOTTOM, //posisi pada android
                          timeInSecForIosWeb: 3, //lama muncul pesan pada web
                          webPosition:
                              "center", //posisi pada web + kombinasi gravity
                          webBgColor: "white", //warna pada web
                          toastLength: Toast.LENGTH_LONG //lama muncul android
                          );
                      //validasi saat email kosong
                    } else if (emailController.text == "") {
                      Fluttertoast.showToast(
                          msg: "Please enter your email",
                          textColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 255, 17, 0), //warna bg android
                          gravity: ToastGravity.BOTTOM, //posisi pada android
                          timeInSecForIosWeb: 3, //lama muncul pesan pada web
                          webPosition:
                              "center", //posisi pada web + kombinasi gravity
                          webBgColor: "white", //warna pada web
                          toastLength: Toast.LENGTH_LONG //lama muncul android
                          );
                      //validasi saat password kosong
                    } else if (passwordController.text == "") {
                      Fluttertoast.showToast(
                          msg: "Please enter password",
                          textColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 255, 17, 0), //warna bg android
                          gravity: ToastGravity.BOTTOM, //posisi pada android
                          timeInSecForIosWeb: 3, //lama muncul pesan pada web
                          webPosition:
                              "center", //posisi pada web + kombinasi gravity
                          webBgColor: "white", //warna pada web
                          toastLength: Toast.LENGTH_LONG //lama muncul android
                          );
                    } else if (emailController.text == "" &&
                        passwordController.text == "") {
                      Fluttertoast.showToast(
                          msg: "Please enter your email and password",
                          textColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 255, 17, 0), //warna bg android
                          gravity: ToastGravity.BOTTOM, //posisi pada android
                          timeInSecForIosWeb: 3, //lama muncul pesan pada web
                          webPosition:
                              "center", //posisi pada web + kombinasi gravity
                          webBgColor: "white", //warna pada web
                          toastLength: Toast.LENGTH_LONG //lama muncul android
                          );
                    } else if (emailController.text == "Admin" &&
                        passwordController.text == "Admin123") {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const Getxcontrollerpage()));
                    } else {
                      Fluttertoast.showToast(
                          msg: "Invalid email or password",
                          textColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 255, 17, 0), //warna bg android
                          gravity: ToastGravity.BOTTOM, //posisi pada android
                          timeInSecForIosWeb: 3, //lama muncul pesan pada web
                          webPosition:
                              "center", //posisi pada web + kombinasi gravity
                          webBgColor: "white", //warna pada web
                          toastLength: Toast.LENGTH_LONG //lama muncul android
                          );
                    }
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.blue.withOpacity(0.8)),
                  ),
                  child: const Text(
                    "Sign In",
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
                  Container(
                      child: Row(children: [
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
                  ]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
