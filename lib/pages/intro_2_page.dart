import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Intro2Page extends StatefulWidget {
  const Intro2Page({super.key});

  @override
  State<Intro2Page> createState() => _Intro2PageState();
}

class _Intro2PageState extends State<Intro2Page> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold (
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
          ],
        ),
      ),
    );
  }
}