import 'package:flutter/material.dart';
import 'splashScreen.dart';

void main() => runApp(MinosTechsApp());

class MinosTechsApp extends StatefulWidget {
  @override
  _MinosTechsAppState createState() => new _MinosTechsAppState();
}

class _MinosTechsAppState extends State<MinosTechsApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: SplashScreen());
  }
}
