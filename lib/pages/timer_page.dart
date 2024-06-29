import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/styles.dart';
import '../providers/provider.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  bool notStarted = true;

  late Timer _timer;
  String timeEnd = "--:--:--";
  String toTime = "--:--:--";
  // bool checker = false;
  int currentTime = 0;
  int timeToEnd = 0;

  void startTimer(int timeToEnd) {
    int hoursTo = 0;
    int minutesTo = 0;
    int secondsTo = 0;

    int hoursEnd = 0;
    int minutesEnd = 0;
    int secondsEnd = 0;

    String strHourEnd = "00";
    String strMinuteEnd = "00";
    String strSecondEnd = "00";

    String strHourTo = "00";
    String strMinuteTo = "00";
    String strSecondTo = "00";

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      hoursEnd = timeToEnd ~/ 3600;
      minutesEnd = (timeToEnd % 3600) ~/ 60;
      secondsEnd = (timeToEnd % 3600) % 60;

      hoursTo = currentTime ~/ 3600;
      minutesTo = (currentTime % 3600) ~/ 60;
      secondsTo = (currentTime % 3600) % 60;

      // if (checker) {
      //   checker = false;
      //   timer.cancel();
      // }

      if (hoursEnd < 10) {
        strHourEnd = "0$hoursEnd";
      } else {
        strHourEnd = hoursEnd.toString();
      }
      if (minutesEnd < 10) {
        strMinuteEnd = "0$minutesEnd";
      } else {
        strMinuteEnd = minutesEnd.toString();
      }
      if (secondsEnd < 10) {
        strSecondEnd = "0$secondsEnd";
      } else {
        strSecondEnd = secondsEnd.toString();
      }
      setState(() {
        timeEnd = "$strHourEnd:$strMinuteEnd:$strSecondEnd";
      });

      if (hoursTo < 10) {
        strHourTo = "0$hoursTo";
      } else {
        strHourTo = hoursTo.toString();
      }
      if (minutesTo < 10) {
        strMinuteTo = "0$minutesTo";
      } else {
        strMinuteTo = minutesTo.toString();
      }
      if (secondsTo < 10) {
        strSecondTo = "0$secondsTo";
      } else {
        strSecondTo = secondsTo.toString();
      }
      setState(() {
        toTime = "$strHourTo:$strMinuteTo:$strSecondTo";
      });

      if (timeToEnd == 0) {
        timer.cancel();
      } else {
        setState(() {
          currentTime++;
          timeToEnd--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dayProvider = Provider.of<DayProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Intermittent Fasting', style: basicStyle),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(flex: 1, child: Text('')),
            Text(timeEnd, style: const TextStyle(fontSize: 100)),
            const SizedBox(height: 30),
            Text("PASSED TIME: $toTime", style: basicStyle),
            const SizedBox(height: 10),
            SizedBox(
              width: 335,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(greyButton),
                    textStyle: WidgetStateProperty.all<TextStyle>(
                        const TextStyle(color: Colors.black, fontSize: 16)),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.black),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  if (notStarted) {
                    setState(() {
                      notStarted = false;
                    });
                    startTimer(dayProvider.hours * 60 * 60 + dayProvider.minutes * 60 + dayProvider.seconds - currentTime);
                  } else {
                    _timer.cancel();
                    setState(() {
                      notStarted = true;
                    });
                  }
                },
                child: Icon(
                  notStarted ? Icons.play_arrow : Icons.pause,
                ),
              ),
            ),
            const Expanded(flex: 1, child: Text('')),
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
                  _timer.cancel();
                  dayProvider.totalTime = toTime;
                  timeEnd = "--:--:--";
                  toTime = "--:--:--";
                  currentTime = 0;
                  timeToEnd = 0;
                  Navigator.of(context).pushNamed('/result');
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
