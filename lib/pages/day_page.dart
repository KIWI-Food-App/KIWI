import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/styles.dart';
import '../providers/provider.dart';

class DayPage extends StatefulWidget {
  const DayPage({super.key});

  static const routeName = '/day_page';

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  final image = const AssetImage('img/kiwi_logo.jpg');
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _breakfast;
  late Future<int> _lunch;
  late Future<int> _dinner;
  late Future<int> _other;

  @override
  void initState() {
    super.initState();
    _breakfast = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('breakfast') ?? 0;
    });
    _lunch = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('lunch') ?? 0;
    });
    _dinner = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('dinner') ?? 0;
    });
    _other = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('other') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dayProvider = Provider.of<DayProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('New Day', style: basicStyle),
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
            const SizedBox(height: 20),
            // - - - - - - - - - - - - - - - - - - - - - - - - - - -
            Expanded(
                flex: 6,
                child: Column(children: [
                  Text("Breakfast", style: basicStyle),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  SizedBox(
                    width: 335,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder(
                            future: _breakfast,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              return SizedBox(
                                width: 250,
                                height: 40,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: '${snapshot.data} kcal',
                                  ),
                                  keyboardType: TextInputType.number,
                                  controller: controller,
                                ),
                              );
                            }),
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(0),
                                ),
                                backgroundColor:
                                    WidgetStateProperty.all<Color>(greyButton),
                                shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            onPressed: () {
                              dayProvider.breakfast =
                                  int.parse(controller.text);

                              dayProvider.saveDayToLocalStorage();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Breakfast Saved!"),
                                ),
                              );
                            },
                            child: const Center(
                                child: Icon(Icons.check,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 40)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // - - - - - - - - - - - - - - - - - - - - - - - - - - -
                  Text("Lunch", style: basicStyle),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  SizedBox(
                    width: 335,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         FutureBuilder(
                            future: _lunch,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              return SizedBox(
                          width: 250,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: '${snapshot.data} kcal',
                            ),
                            keyboardType: TextInputType.number,
                            controller: controller2,
                          ),
                        );
                                }),
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(0),
                                ),
                                backgroundColor:
                                    WidgetStateProperty.all<Color>(greyButton),
                                shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            onPressed: () {
                              dayProvider.lunch = int.parse(controller2.text);

                              dayProvider.saveDayToLocalStorage();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Lunch Saved!"),
                                ),
                              );
                            },
                            child: const Center(
                                child: Icon(Icons.check,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 40)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // - - - - - - - - - - - - - - - - - - - - - - - - - - -
                  Text("Dinner", style: basicStyle),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  SizedBox(
                    width: 335,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder(
                            future: _dinner,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              return SizedBox(
                          width: 250,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: const  OutlineInputBorder(),
                              hintText: '${snapshot.data} kcal',
                            ),
                            keyboardType: TextInputType.number,
                            controller: controller3,
                          ),
                        );}),
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(0),
                                ),
                                backgroundColor:
                                    WidgetStateProperty.all<Color>(greyButton),
                                shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            onPressed: () {
                              dayProvider.dinner = int.parse(controller3.text);
                              dayProvider.saveDayToLocalStorage();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Dinner Saved!"),
                                ),
                              );
                            },
                            child: const Center(
                                child: Icon(Icons.check,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 40)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // - - - - - - - - - - - - - - - - - - - - - - - - - - -
                  Text("Other", style: basicStyle),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  SizedBox(
                    width: 335,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder(
                            future: _other,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              return SizedBox(
                          width: 250,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: '${snapshot.data} kcal',
                            ),
                            keyboardType: TextInputType.number,
                            controller: controller4,
                          ),
                        );}),
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(0),
                                ),
                                backgroundColor:
                                    WidgetStateProperty.all<Color>(greyButton),
                                shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            onPressed: () {
                              dayProvider.other = int.parse(controller4.text);
                              dayProvider.saveDayToLocalStorage();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Other Saved!"),
                                ),
                              );
                            },
                            child: const Center(
                                child: Icon(Icons.check,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 40)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),
            const SizedBox(height: 10),
            // - - - - - - - - - - - - - - - - - - - - - - - - - - -
            SizedBox(
              width: 335,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(greyButton),
                    textStyle: WidgetStateProperty.all<TextStyle>(buttonStyle),
                    foregroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromARGB(255, 0, 0, 0)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  dayProvider.breakfast = int.parse(controller.text);
                  dayProvider.lunch = int.parse(controller2.text);
                  dayProvider.dinner = int.parse(controller3.text);
                  dayProvider.other = int.parse(controller4.text);
                  dayProvider.saveDayToLocalStorage();
                  Navigator.of(context).pushNamed('/set');
                },
                child: const Text('INTERMITTENT FASTING'),
              ),
            ),
            const SizedBox(height: 10),
            // - - - - - - - - - - - - - - - - - - - - - - - - - - -
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
                  dayProvider.breakfast = int.parse(controller.text);
                  dayProvider.lunch = int.parse(controller2.text);
                  dayProvider.dinner = int.parse(controller3.text);
                  dayProvider.other = int.parse(controller4.text);
                  dayProvider.saveDayToLocalStorage();
                  Navigator.of(context).pushNamed('/result');
                },
                child: const Text('CREATE'),
              ),
            ),
            const Expanded(flex: 1, child: Text('')),
          ],
        ),
      ),
    );
  }
}
