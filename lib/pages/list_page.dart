import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/styles.dart';
import '../data/day.dart';
import '../providers/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Icon getIcon(SessionReaction type) {
    switch (type) {
      case SessionReaction.Excellent:
        return Icon(Icons.favorite, color: Colors.red);
      case SessionReaction.Good:
        return Icon(Icons.sentiment_satisfied_rounded, color: kiwiGreen);
      case SessionReaction.Neutral:
        return Icon(Icons.sentiment_neutral_rounded, color: Color.fromARGB(255, 255, 170, 0));
      case SessionReaction.Bad:
        return Icon(Icons.sentiment_very_dissatisfied_outlined, color: const Color.fromARGB(255, 0, 0, 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    final dayProvider = Provider.of<DayProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('List of Days', style: basicStyle),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(Icons.settings, size: 30, )),
          ],
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        for (Day day in dayProvider.days)
                          Container(
                            width: 335,
                            height: 50,
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: greyButton),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text("${day.counter}. "))),
                                const Padding(
                                    padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                    flex: 1,
                                    child: getIcon(day.reaction)),
                                const Padding(
                                    padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                    flex: 4,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            "${day.breakfast + day.lunch + day.dinner + day.other} kcal"))),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Expanded(
                                    flex: 4,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            "Fasting: ${day.totalTime == '' ? '00:00:00' : day.totalTime}"))),
                                const Padding(
                                    padding: EdgeInsets.only(left: 10)),
                              ],
                            ),
                          ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 335,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              'Avg: ${dayProvider.gender == "Male" ? '${10*dayProvider.weight + 6.25*dayProvider.height - 5*dayProvider.age + 5}' : '${10*dayProvider.weight + 6.25*dayProvider.height - 5*dayProvider.age - 161}'} kcal',
                              style: basicStyle,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              'Wg loss: ${dayProvider.gender == "Male" ? '${(10*dayProvider.weight + 6.25*dayProvider.height - 5*dayProvider.age + 5) * 0.8}' : '${(10*dayProvider.weight + 6.25*dayProvider.height - 5*dayProvider.age - 161) * 0.8}'} kcal',
                              style: basicStyle,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 335,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(kiwiGreen),
                        textStyle:
                            WidgetStateProperty.all<TextStyle>(buttonStyle),
                        foregroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      dayProvider.totalTime = '';
                      dayProvider.hours = 0;
                      dayProvider.minutes = 0;
                      dayProvider.seconds = 0;
                      Navigator.of(context).pushNamed('/day');
                    },
                    child: const Text('START NEW DAY'),
                  ),
                ),
                const Expanded(flex: 1, child: Text('')),
              ]),
        ));
  }
}
