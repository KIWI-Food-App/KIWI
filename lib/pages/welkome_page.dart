import 'package:flutter/material.dart';
import 'package:start_folder_to_zip/data/styles.dart';

class WelkomePage extends StatefulWidget {
  const WelkomePage({super.key});

  @override
  State<WelkomePage> createState() => _WelkomePageState();
}

class _WelkomePageState extends State<WelkomePage> {
  final image = const AssetImage('img/kiwi_logo.jpg');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  "\nKIWI",
                  style: logoStyle,
                ),
              ],
            ),
            Text(
              "Title",
              style: titleStyle,
            ),
            Text(
              "basicStyle",
              style: basicStyle,
            ),
            Container(
              color: Colors.green,
              child: Text(
                "BUTTON STYLE",
                style: buttonStyle,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: kiwiGreen,
            ),
            Container(
              height: 100,
              width: 100,
              color: greyButton,
            ),
            SizedBox(
              width: 335,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(kiwiGreen),
                    textStyle: WidgetStateProperty.all<TextStyle>(buttonStyle),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.of(context).pushNamed('/sign');
                },
                child: const Text('GET STARTED'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
