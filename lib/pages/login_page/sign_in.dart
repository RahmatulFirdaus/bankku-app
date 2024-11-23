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
  bool _visiblePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _visiblePassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return _buildBody(maxWidth: 500);
        } else {
          return _buildBody();
        }
      }),
    );
  }

  Widget _buildBody({double? maxWidth}) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.blue.shade50,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _mainValue(context),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _mainValue(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade100,
                  padding: const EdgeInsets.all(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Sign in to continue",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 32),
          _buildInputField(
            label: "Email Address",
            controller: emailController,
            hintText: email,
            prefixIcon: Icons.email_outlined,
          ),
          const SizedBox(height: 16),
          _buildInputField(
            label: "Password",
            controller: passwordController,
            hintText: password,
            prefixIcon: Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _handleSignIn,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              "Sign In",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(color: Colors.grey.shade700),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signup()));
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? _visiblePassword : false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            prefixIcon: Icon(prefixIcon, size: 20, color: Colors.grey.shade600),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _visiblePassword
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                      size: 20,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: () {
                      setState(() {
                        _visiblePassword = !_visiblePassword;
                      });
                    },
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  void _handleSignIn() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      _showToast("Please enter your email and password");
    } else if (emailController.text.isEmpty) {
      _showToast("Please enter your email");
    } else if (passwordController.text.isEmpty) {
      _showToast("Please enter password");
    } else if (emailController.text == "Admin" &&
        passwordController.text == "Admin123") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const Getxcontrollerpage()));
    } else {
      _showToast("Invalid email or password");
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      backgroundColor: Colors.red,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      webPosition: "center",
      webBgColor: "red",
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
