import 'package:flutter/material.dart';
import 'package:minostechsapp/Navigation/slideLeft.dart';
import 'package:minostechsapp/pages/cardCreationScreen.dart';
import 'package:minostechsapp/pages/interestsScreen.dart';
import 'package:minostechsapp/pages/signupScreen.dart';
import 'package:minostechsapp/Navigation/slideRight.dart';
import 'package:minostechsapp/pages/loginScreen.dart';

void main() => runApp(MinosTechsApp());

class MinosTechsApp extends StatefulWidget {
  @override
  _MinosTechsAppState createState() => new _MinosTechsAppState();
}

class _MinosTechsAppState extends State<MinosTechsApp> {
  get blackColor => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'loginScreen':
            return SlideRightRoute(page: Login());
            break;
          case 'signUpScreen':
            return SlideLeftRoute(page: SignUp());
            break;
          case 'interestsScreen':
            return SlideLeftRoute(page: Interests());
            break;
          case 'CardCreation':
            return SlideLeftRoute(page: CardCreation());
            break;
        }
      },
    );
  }
}
