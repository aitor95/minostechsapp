import 'package:cloud_firestore/cloud_firestore.dart';

class VisitCard {
  String color;

  VisitCard({
    this.color,
  });

  factory VisitCard.fromDoc(DocumentSnapshot doc) {
    return VisitCard(
      color: doc['color'],
    );
  }
}
