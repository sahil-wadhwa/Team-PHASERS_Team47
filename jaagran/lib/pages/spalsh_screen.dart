import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jaagran/pages/home.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 6), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(135, 66, 145, 1),
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Image(
            image: AssetImage('images/splash.gif'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
