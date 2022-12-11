import 'package:flutter/material.dart';
import 'package:flutter_signin_and_local_storage/Screens/Login.dart';
import 'package:flutter_signin_and_local_storage/Services/AuthService.dart';

class Settings extends StatefulWidget {
  static String routeName = "/settings";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              _authService.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Login.routeName, (Route<dynamic> route) => false);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: const Center(child: Text("Settings")),
    );
  }
}
