import 'package:flutter/material.dart';
import 'package:flutter_signin_and_local_storage/Screens/Dashboard.dart';
import 'package:flutter_signin_and_local_storage/Screens/Signup.dart';
import 'package:flutter_signin_and_local_storage/Services/AuthService.dart';
import 'package:flutter_signin_and_local_storage/Widgets/InputText.dart';
import 'package:flutter_signin_and_local_storage/Widgets/InputPassword.dart';
import 'package:flutter_signin_and_local_storage/Widgets/PrimaryButton.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService _authService = AuthService();
  bool obscurePassword = true;
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .9,
                child: Column(
                  children: [
                    InputText(
                        labelText: "Email Address",
                        hintText: "Enter Email Address",
                        controller: _authService.email,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputPassword(
                        obscureText: obscurePassword,
                        onTap: handleObscurePassword,
                        labelText: "Password",
                        hintText: "Enter Your Password",
                        controller: _authService.password),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Login",
                      iconData: Icons.login,
                      onPress: () {
                        loginWithProvider();
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            loginWithProvider();
                            Navigator.pushReplacementNamed(
                                context, Signup.routeName);
                          },
                          child: const Text(
                            "Don't have an account? Sign up here.",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  loginWithProvider() {
    try {
      setState(() {
        isLogin = true;
      });
      _authService.loginUser();
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    } catch (e) {
      print(e);
    }
  }
}
