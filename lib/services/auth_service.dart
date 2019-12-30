import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minostechsapp/Navigation/NavigationBar.dart';
import 'package:minostechsapp/pages/loginScreen.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUpUser(BuildContext context, String username, String email,
      String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser signedUser = authResult.user;
      if (signedUser != null) {
        _firestore.collection('/users').document(signedUser.uid).setData({
          'cardId': 0,
          'name': '',
          'profession': '',
          'profileImageUrl': '',
          'surname1': '',
          'surname2': '',
          'username': username,
          'userLinkedIn': '',
          'email': email,
          'password': password,
        });
        Navigator.pushReplacementNamed(context, NavigationBar.id);
      }
    } catch (e) {
      print(e);
    }
  }

  static void logout(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, Login.id);
  }

  static void login(String email, String password) async {
    _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
