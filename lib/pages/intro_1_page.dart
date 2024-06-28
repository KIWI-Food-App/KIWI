import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Intro1Page extends StatefulWidget {
  const Intro1Page({super.key});

  @override
  State<Intro1Page> createState() => _Intro1PageState();
}

class _Intro1PageState extends State<Intro1Page> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold (
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "KIWI",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}