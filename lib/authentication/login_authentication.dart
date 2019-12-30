import 'package:flutter/material.dart';
import 'package:minostechsapp/pages/signupScreen.dart';
import 'package:minostechsapp/pages/loginScreen.dart';

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget child;

    if (1 == 1) {
      child = Login();
    } else {
      child = SignUp();
    }
    return Scaffold(
      body: Center(child: child),
    );
  }
}
