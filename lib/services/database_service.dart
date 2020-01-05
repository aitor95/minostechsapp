import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minostechsapp/models/user_model.dart';
import 'package:minostechsapp/models/visitCard_model.dart';
import 'package:minostechsapp/utilities/constants.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  static void updateUser(User user) {
    usersRef.document(user.id).updateData({
      'name': user.name,
      'profileImageUrl': user.profileImageUrl,
    });
  }

  Future updateUserCard(String color) async {
    return await cardRef.document(uid).setData({
      'color': color,
    });
  }

  static Future<User> getUserWithId(String userId) async {
    DocumentSnapshot userDocSnapshot = await usersRef.document(userId).get();
    if (userDocSnapshot.exists) {
      return User.fromDoc(userDocSnapshot);
    }
    return User();
  }

  // static void updateInterest(User user, String interest) async {
  //   usersRef.document(user.id).updateData({
  //     'interests': interest,
  //   });
  // }

  static void updateCard() {}
}
