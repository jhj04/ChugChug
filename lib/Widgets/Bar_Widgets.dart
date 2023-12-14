import 'dart:ui';

import 'package:flutter/cupertino.dart';

Row Top_Logos(String logoTitle, double fontSize){
  return Row(
    children: [
      Image.asset(
        'assets/ChugChug_Typo.png',
        fit: BoxFit.contain,
        height: 50,
      ),
      SizedBox(width: 8), // Add spacing between image and text
      Text(
        logoTitle,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: "Fraunces",
          fontVariations: <FontVariation>[FontVariation('wght', 700.0)],
        ),
      ),
    ],
  );
}