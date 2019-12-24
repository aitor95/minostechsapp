import 'package:flutter/material.dart';
import '../pages/login.dart';
import '../pages/register.dart';

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget child;

    if (1 == 1) {
      child = Login();
    } else {
      child = Register();
    }
    return Scaffold(
      body: Center(child: child),
    );
  }
}
