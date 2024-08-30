import 'package:flutter/material.dart';
class Backgroundimage extends StatelessWidget {
  const Backgroundimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/drawable/screenbackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Your other widgets go here
        ),
      ),

    );
  }
}
