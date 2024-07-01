import 'package:flutter/material.dart';
import 'package:start_folder_to_zip/data/styles.dart';
// import 'package:flutter/widgets.dart';

class Intro3Page extends StatefulWidget {
  const Intro3Page({super.key});

  @override
  State<Intro3Page> createState() => _Intro3PageState();
}

class _Intro3PageState extends State<Intro3Page> {

  final image_intro3 = const AssetImage('img/intro_3.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          const Expanded(
            flex: 2,
            child: Text(""),
          ),
          Image(image: image_intro3, width: 300, height: 300),
          const Expanded(
            flex: 2,
            child: Text(""),
          ),
          Text(
            "Save meals",
            style: titleStyle,
          ),
          const Expanded(
            flex: 1,
            child: Text(""),
          ),
          Text(
            "Quickly find your type of food and save",
            style: basicStyle,
          ),
          Text(
            "information about your meals",
            style: basicStyle,
          ),
          const Expanded(
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
                Navigator.of(context).pushNamed('/sign');
              },
              child: const Text('NEXT'),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Text(""),
          ),
            
          ],
        ),
      ),
    );
  }
}