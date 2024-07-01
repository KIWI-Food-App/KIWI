import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/styles.dart';
import '../providers/provider.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final image = const AssetImage('img/kiwi_logo.jpg');
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    final dayProvider = Provider.of<DayProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In', style: basicStyle),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Align(
                    alignment: Alignment.center,
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
                    ))),
            const Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
                flex: 6,
                child: Column(children: [
                  SizedBox(
                    width: 320,
                    height: 40,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'your weight (kg)',
                      ),
                      keyboardType: TextInputType.number,
                      controller: controller,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  SizedBox(
                    width: 320,
                    height: 40,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'your height (cm)',
                      ),
                      keyboardType: TextInputType.number,
                      controller: controller2,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  SizedBox(
                    width: 320,
                    height: 40,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'your age (years)',
                      ),
                      keyboardType: TextInputType.number,
                      controller: controller3,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    width: 320,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      items: <String>['Male', 'Female'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            width: 285,
                            height: 50,
                            margin: const EdgeInsets.all(3.0),
                            padding: const EdgeInsets.all(3.0),
                            child: Text(value),
                            alignment: AlignmentDirectional.centerStart,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? val) {
                        if (val == 'Male') {
                          dayProvider.gender = 'Male';
                        } else {
                          dayProvider.gender = 'Female';
                        }
                        setState(() {
                          dropdownValue = val!;
                        });
                      },
                    ),
                  ),
                ])),
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
                  dayProvider.weight = int.parse(controller.text);
                  dayProvider.height = int.parse(controller2.text);
                  dayProvider.age = int.parse(controller3.text);
                  dayProvider.saveSignToLocalStorage();
                  // dayProvider.saveToLocalStorage();
                  Navigator.of(context).pushNamed('/list');
                },
                child: const Text('GET STARTED'),
              ),
            ),
            const Expanded(flex: 1, child: Text('')),
          ],
        ),
      ),
    );
  }
}
