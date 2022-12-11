import 'package:flutter/material.dart';
import 'package:flutter_signin_and_local_storage/Screens/Login.dart';
import 'package:flutter_signin_and_local_storage/Services/AuthService.dart';
import 'package:flutter_signin_and_local_storage/Widgets/InputText.dart';
import 'package:flutter_signin_and_local_storage/Widgets/PrimaryButton.dart';

import 'Dashboard.dart';

class Signup extends StatefulWidget {
  static String routeName = "/signup";
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  AuthService _authService = AuthService();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  bool isSignUp = false;
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
                        labelText: "First Name",
                        hintText: "Enter First Name",
                        controller: firstNameController,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputText(
                        labelText: "Last Name",
                        hintText: "Enter Last Name",
                        controller: lastNameController,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputText(
                        labelText: "Email Address",
                        hintText: "Enter Email Address",
                        controller: _authService.email,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputText(
                        labelText: "Password",
                        hintText: "Enter Password",
                        controller: _authService.password,
                        textInputType: TextInputType.visiblePassword),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Sign Up",
                      iconData: Icons.login,
                      onPress: () {
                        signUpProvider();
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
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

  signUpProvider() {
    try {
      setState(() {
        isSignUp = true;
      });
      _authService.signupUser();
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    } catch (e) {
      print(e);
    }
  }
}
