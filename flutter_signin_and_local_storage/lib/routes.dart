import 'package:flutter/cupertino.dart';
import 'package:flutter_signin_and_local_storage/Screens/Login.dart';
import 'package:flutter_signin_and_local_storage/Screens/Signup.dart';
import 'package:flutter_signin_and_local_storage/Screens/Dashboard.dart';
import 'package:flutter_signin_and_local_storage/Screens/Settings.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => Login(),
  Signup.routeName: (BuildContext context) => Signup(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  Settings.routeName: (BuildContext context) => Settings(),
};
