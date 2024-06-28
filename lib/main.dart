import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/welkome_page.dart';
import 'providers/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DayProvider())],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      initialRoute: '/',
      routes: {
        '/': (context) => WelkomePage(),
        // '/intro1': (context) => Intro1Page(),
        // '/intro2': (context) => Intro2Page(),
        // '/intro3': (context) => Intro3Page(),
        // '/sign': (context) => SignPage(),
        // '/list': (context) => ListPage(),
        // '/settings': (context) => SettingsPage(),
        // '/day': (context) => DatPage(),
        // '/set': (context) => SetPage(),
        // '/timer': (context) => TimerPage(),
        // '/result': (context) => ResultPage(),
      },
    );
  }

}