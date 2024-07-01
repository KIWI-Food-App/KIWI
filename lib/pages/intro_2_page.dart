import 'package:flutter/material.dart';
import 'package:start_folder_to_zip/data/styles.dart';
// import 'package:flutter/widgets.dart';

class Intro2Page extends StatefulWidget {
  const Intro2Page({super.key});

  @override
  State<Intro2Page> createState() => _Intro2PageState();
}

class _Intro2PageState extends State<Intro2Page> {

  final image_intro2 = const AssetImage('img/intro_2.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold (
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
          Image(image: image_intro2, width: 338, height: 338),
          const Expanded(
            flex: 2,
            child: Text(""),
          ),
          Text(
            "Intermittent fasting",
            style: titleStyle,
          ),
          const Expanded(
            flex: 1,
            child: Text(""),
          ),
          Text(
            "Control the time of use of periodic",
            style: basicStyle,
          ),
          Text(
            " fasting for convenience",
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
                Navigator.of(context).pushNamed('/intro3');
              },
              child: const Text('NEXT'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(""),
          ),
            
          ],
        ),
      ),
    );
  }
}