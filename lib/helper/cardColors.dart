import 'package:flutter/material.dart';

class CardColor {
  static const baseColors = <Color>[
    Color.fromRGBO(215, 127, 161, 1.0), //pink
    Color.fromRGBO(172, 141, 175, 1.0), //Purple
    Color.fromRGBO(159, 223, 205, 1.0), //Green
    Color.fromRGBO(176, 222, 255, 1.0), //blue
    Color.fromRGBO(240, 246, 159, 1.0), //yellow
    Color.fromRGBO(255, 182, 119, 1.0), //orange
    Color.fromRGBO(181, 207, 216, 1.0), //grayishBlue
  ];

  static const baseColorsNames = <String>[
    "pink",
    "purple",
    "green",
    "blue",
    "yellow",
    "orange",
    "grayBlue"
  ];

  // static List<CardColorsModel> cardColors = new List<CardColorsModel>.generate(
  //     baseColors.length,
  //     (int index) => CardColorsModel(isSelected: false, cardColor: index));

}
