import 'package:flutter/material.dart';
import 'dart:ui';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/ChugChug_Typo.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            SizedBox(width: 8), // Add spacing between image and text
            Text(
              'Shopping',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Fraunces",
                fontVariations: const <FontVariation>[FontVariation('wght', 700.0)],
              ),
            ),
          ],
        ),
      ),
      body: 
      Center(
        child: Container(
          width: double.infinity,
          height: 160,
          color: Colors.blue.withOpacity(0.1),
          child: Text(
            'Coming soon',
            style: TextStyle(
              color: Color(0xff6CA1F1),
              fontSize: 30,
              fontFamily: "Fraunces",
              fontVariations: const <FontVariation>[FontVariation('wght', 700.0)],
              ),
              textAlign: TextAlign.center,
            ),
        ),
      ),
    );
  }
}