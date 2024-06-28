import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import '../img/kiwi_logo.svg';
// import '../img/kiwi_logo.pdf';
// import 'package:flutter_svg/flutter_svg.dart';

class WelkomePage extends StatefulWidget {
  const WelkomePage({super.key});

  @override
  State<WelkomePage> createState() => _WelkomePageState();
}

class _WelkomePageState extends State<WelkomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset('../img/kiwi_logo.svg'),
                // Image.asset('../img/kiwi_logo.png'),
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