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
            const Expanded(flex: 5, child: Text(""),),
            Expanded(
              flex: 4, 
              child: Row(
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
            ),
            const Expanded(flex: 4, child: Text(""),),
             Text(
                "Welcome",
                style: titleStyle,
              ),

            const Expanded(flex: 1, child: Text(""),),
      
             Text(
              "It’s a pleasure to meet you. We are\nexcited that you’re here so let’s get",
              style: basicStyle, 
            ),
            Text("started!", style:  basicStyle,),

            const Expanded(flex: 2, child: Text(""),),

          
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
                  Navigator.of(context).pushNamed('/intro1');
                },
                child: const Text('GET STARTED'),
              ),
            ),
            const Expanded(flex: 2, child: Text(""),),
          ],
        ),
      ),
    );
  }
}
