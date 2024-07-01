import 'package:flutter/material.dart';
import 'package:start_folder_to_zip/data/styles.dart';
// import 'package:flutter/widgets.dart';

class Intro1Page extends StatefulWidget {
  const Intro1Page({super.key});

  @override
  State<Intro1Page> createState() => _Intro1PageState();
}

class _Intro1PageState extends State<Intro1Page> {
  final image_intro1 = const AssetImage('img/intro_1.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 2,
            child: Text(""),
          ),
          Image(image: image_intro1, width: 338, height: 338),
          const Expanded(
            flex: 2,
            child: Text(""),
          ),
          Text(
            "All your favorites",
            style: titleStyle,
          ),
          const Expanded(
            flex: 1,
            child: Text(""),
          ),
          Text(
            "Calculate the right amount of calories",
            style: basicStyle,
          ),
          Text(
            " for your diet",
            style: basicStyle,
          ),
          Expanded(
            flex: 1,
            child: Text(""),
          ),
          SizedBox(
            width: 335,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(kiwiGreen),
                  textStyle: WidgetStateProperty.all<TextStyle>(buttonStyle),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                Navigator.of(context).pushNamed('/intro2');
              },
              child: const Text('NEXT'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(""),
          ),
        ],
      )),
    );
  }
}
