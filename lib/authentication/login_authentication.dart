import 'package:flutter/material.dart';

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget child;

    // TODO: Authentication Login
    if (1 == 1) {
      child = Text(
        "Done!",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      );
    } else {
      child = Text(
        "Nope!",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      );
    }
    return Scaffold(
      body: Center(child: child),
    );
  }
}
