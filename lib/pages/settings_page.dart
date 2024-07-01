import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/styles.dart';
import '../providers/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final image = const AssetImage('img/kiwi_logo.jpg');
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  String dropdownValue = 'Male';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _weight;
  late Future<int> _height;
  late Future<int> _age;
  late Future<String> _gender;

  @override
  void initState() {
    super.initState();
    _weight = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('weight') ?? 0;
    });
    _height = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('height') ?? 0;
    });
    _age = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('age') ?? 0;
    });
    _gender = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('gender') ?? "Male";
    });
  }

  @override
  Widget build(BuildContext context) {
    final dayProvider = Provider.of<DayProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: basicStyle),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
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
            const Expanded(flex: 1, child: Text('')),
            Expanded(
                flex: 6,
                child: Column(children: [
                  FutureBuilder(
                            future: _weight,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              return SizedBox(
                    width: 320,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'your weight — ${snapshot.data} kg',
                      ),
                      keyboardType: TextInputType.number,
                      controller: controller,
                    ),
                  );
                }),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  FutureBuilder(
                            future: _height,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              return SizedBox(
                    width: 320,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'your height — ${snapshot.data} cm',
                      ),
                      keyboardType: TextInputType.number,
                      controller: controller2,
                    ),
                  );}),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  FutureBuilder(
                            future: _age,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              return SizedBox(
                    width: 320,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'your age — ${snapshot.data} years',
                      ),
                      keyboardType: TextInputType.number,
                      controller: controller3,
                    ),
                  );}),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  FutureBuilder(
                            future: _gender,
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              return SizedBox(
                    width: 320,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                          textStyle:
                              WidgetStateProperty.all<TextStyle>(const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500,)),
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.black),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: const BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.circular(5)))),
                      onPressed: () {
                        if (dayProvider.gender == 'Male') {
                          dayProvider.gender = 'Female';
                          dayProvider.saveSignToLocalStorage();
                          setState(() {
                            _gender = _prefs.then((SharedPreferences prefs) {
                              return prefs.getString('gender') ?? "Male";
                            });
                          });
                        } else {
                          dayProvider.gender = 'Male';
                          dayProvider.saveSignToLocalStorage();
                          setState(() {});
                        }
                      },
                      child: Text('your gender — ${dayProvider.gender}'),
                    ),
                  );}),
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
                  Navigator.of(context).pushNamed('/list');
                },
                child: const Text('SAVE SETTINGS'),
              ),
            ),
            const Expanded(flex: 1, child: Text('')),
          ],
        ),
      ),
    );
  }
}
