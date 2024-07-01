import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/styles.dart';
import '../providers/provider.dart';

class SetPage extends StatefulWidget {
  const SetPage({super.key});

  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dayProvider = Provider.of<DayProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Time', style: basicStyle,),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(flex: 2, child: Text('')),
            Text('Pull the duration of Session', style: basicStyle),
            const SizedBox(height: 25),
            SizedBox(
              width: 320,
              height: 40,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'hours',
                ),
                keyboardType: TextInputType.number,
                controller: controller,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 320,
              height: 40,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'minutes',
                ),
                keyboardType: TextInputType.number,
                controller: controller2,
              ),
            ),
            const SizedBox(height: 40),
            const Expanded(flex: 4, child: Text('')),
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
                  dayProvider.hours = int.parse(controller.text);
                  dayProvider.minutes = int.parse(controller2.text);
                  dayProvider.saveTimeToLocalStorage();
                  if (dayProvider.hours < 99 && dayProvider.hours >= 0 && dayProvider.minutes < 60 && dayProvider.minutes > 0) {
                    Navigator.of(context).pushNamed('/timer');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Invalid Input\nHours: 0 - 99\nMinutes: 1 - 59"),
                      ),
                    );
                  }
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
