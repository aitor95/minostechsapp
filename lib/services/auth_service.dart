import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minostechsapp/Navigation/NavigationBar.dart';
import 'package:minostechsapp/pages/interestsScreen.dart';
import 'package:minostechsapp/services/database_service.dart';
import 'package:minostechsapp/utilities/constants.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  // register with email and password
  static void signUpUser(BuildContext context, String username, String email,
      String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser signedUser = authResult.user;

      // Relate this new user with a new card with the default color Blue
      await DatabaseService(uid: signedUser.uid).updateUserCard('blue');
      if (signedUser != null) {
        usersRef.document(signedUser.uid).setData({
          'name': '',
          'profession': '',
          'profileImageUrl': '',
          'surname1': '',
          'surname2': '',
          'userLinkedin': '',
          'email': email,
          'password': password,
          'firstTime': true,
          'interests': '',
          'country': '',
        });
        Navigator.pushReplacementNamed(context, Interests.id);
      }
    } catch (e) {
      print(e);
    }
  }

  //Logout the user from the app
  static void logout(BuildContext context) {
    _auth.signOut();
    // Navigator.pushReplacementNamed(context, Login.id);
  }

  // Log in the app with the user
  static void login(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
