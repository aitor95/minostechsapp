import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minostechsapp/Navigation/NavigationBar.dart';
import 'package:minostechsapp/Navigation/slideLeft.dart';
import 'package:minostechsapp/models/user_data.dart';
import 'package:minostechsapp/pages/cardCreationScreen.dart';
import 'package:minostechsapp/pages/homeScreen.dart';
import 'package:minostechsapp/pages/interestsScreen.dart';
import 'package:minostechsapp/pages/signupScreen.dart';
import 'package:minostechsapp/Navigation/slideRight.dart';
import 'package:minostechsapp/pages/loginScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MinosTechsApp());

class MinosTechsApp extends StatelessWidget {
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          Provider.of<UserData>(context).currentUserId = snapshot.data.uid;

          return NavigationBar();
        } else {
          return Login();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        home: _getScreenId(),
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
            case 'homeScreen':
              return SlideLeftRoute(page: Home());
              break;
            case 'navigationBarScreen':
              return SlideLeftRoute(page: NavigationBar());
              break;
          }
        },
      ),
    );
  }
}
