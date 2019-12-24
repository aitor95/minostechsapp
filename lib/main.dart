import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './authentication/login_authentication.dart';
import 'global.dart';

void main() => runApp(
  MaterialApp(
    home: MinosTechsApp()
  )
);


class MinosTechsApp extends StatefulWidget {
  @override
  _MinosTechsAppState createState() => new _MinosTechsAppState();
}

class _MinosTechsAppState extends State<MinosTechsApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: AfterSplash(),
        image: new Image.asset(
          'assets/images/MinosLogoNegative.png',
          width: 200,
          height: 200,
        ),
        backgroundColor: primaryGreenColor,
        photoSize: 100.0,
        loaderColor: Colors.white);
  }
}
