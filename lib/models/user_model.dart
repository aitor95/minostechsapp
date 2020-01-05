import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String surname1;
  String surname2;
  String profession;
  String userLinkedin;
  String profileImageUrl;
  String email;
  bool firstTime;
  String interest;
  String country;

  User({
    this.id,
    this.name,
    this.surname1,
    this.surname2,
    this.profession,
    this.userLinkedin,
    this.profileImageUrl,
    this.email,
    this.firstTime,
    this.interest,
    this.country,
  });

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      name: doc['name'],
      surname1: doc['surname1'],
      surname2: doc['surname2'],
      profileImageUrl: doc['profileImageUrl'] ?? '',
      profession: doc['profession'],
      userLinkedin: doc['userLinkedin'] ?? '',
      email: doc['email'],
      firstTime: doc['firstTime'],
    );
  }
}
