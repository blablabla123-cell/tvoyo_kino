import 'package:flutter/material.dart';

abstract class ApplicationColors {
  static const scaffoldBackgroundColor = Color.fromARGB(255, 9, 9, 12);
  static const navRailDestIconColor = Color.fromARGB(255, 186, 186, 186);

  static const accentGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 106, 17, 203),
      Color.fromARGB(255, 37, 117, 252)
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const transparentGradient = LinearGradient(
    colors: [
      Color.fromARGB(33, 255, 255, 255),
      Color.fromARGB(40, 255, 255, 255),
      Color.fromARGB(33, 255, 255, 255),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
