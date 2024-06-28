import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class WelkomePage extends StatefulWidget {
  const WelkomePage({super.key});

  @override
  State<WelkomePage> createState() => _WelkomePageState();
}

class _WelkomePageState extends State<WelkomePage> {
  final image = const AssetImage('img/kiwi_logo.jpg');
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold (
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: image, width: 100, height: 100),
                const Text(
                  "\nKIWI",
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