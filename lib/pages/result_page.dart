import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/day.dart';
import '../data/styles.dart';
import '../providers/provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final image = const AssetImage('img/kiwi_logo.jpg');
  String dropdownValue = 'Excellent';

  @override
  Widget build(BuildContext context) {
    final dayProvider = Provider.of<DayProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Results', style: basicStyle,),
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
            Container(
              height: 220,
              width: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: greyButton),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Text('RESULTS', style: basicStyle),
                  Text('- - - - - - - - - - - - - - - - - - - - -',
                      style: basicStyle),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Text(
                      "Sum of Day — ${dayProvider.breakfast + dayProvider.lunch + dayProvider.dinner + dayProvider.other} kcal",
                      style: basicStyle),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Text(
                      "Fasting Duration — ${dayProvider.totalTime == '' ? '00:00:00' : dayProvider.totalTime}",
                      style: basicStyle),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // - - - - - - - - - - - - - - - - - - - - - - - - - - -
            Text('Choose feedback for Day', style: basicStyle),
            // - - - - - - - - - - - - - - - - - - - - - - - - - - -
            const SizedBox(height: 10),
            Container(
              width: 320,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                items: <String>['Excellent', 'Good', 'Neutral', 'Bad']
                    .map((String value) {
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
                  if (val == 'Excellent') {
                    dayProvider.reaction = SessionReaction.Excellent;
                  } else if (val == 'Good') {
                    dayProvider.reaction = SessionReaction.Good;
                  } else if (val == 'Neutral') {
                    dayProvider.reaction = SessionReaction.Neutral;
                  } else {
                    dayProvider.reaction = SessionReaction.Bad;
                  }
                  setState(() {
                    dropdownValue = val!;
                  });
                },
              ),
            ),
            // - - - - - - - - - - - - - - - - - - - - - - - - - - -
            const Expanded(flex: 2, child: Text('')),
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
                  dayProvider.counter = dayProvider.counter + 1;
                  dayProvider.addDay(Day(
                    dayProvider.counter,
                    dayProvider.breakfast,
                    dayProvider.lunch,
                    dayProvider.dinner,
                    dayProvider.other,
                    dayProvider.totalTime,
                    dayProvider.reaction,
                  ));
                  dayProvider.resetDay();
                  dayProvider.saveDays(dayProvider.days);
                  Navigator.of(context).pushNamed('/list');
                },
                child: const Text('FINISH'),
              ),
            ),
            const Expanded(flex: 1, child: Text('')),
          ],
        ),
      ),
    );
  }
}
