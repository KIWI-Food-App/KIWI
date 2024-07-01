import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/day_page.dart';
import 'pages/intro_1_page.dart';
import 'pages/intro_2_page.dart';
import 'pages/intro_3_page.dart';
import 'pages/list_page.dart';
import 'pages/result_page.dart';
import 'pages/set_timer_page.dart';
import 'pages/settings_page.dart';
import 'pages/sign_page.dart';
import 'pages/timer_page.dart';
import 'pages/welkome_page.dart';
import 'providers/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
        '/intro1': (context) => Intro1Page(),
        '/intro2': (context) => Intro2Page(),
        '/intro3': (context) => Intro3Page(),
        '/sign': (context) => SignPage(),
        '/list': (context) => ListPage(),
        '/settings': (context) => SettingsPage(),
        '/day': (context) => DayPage(),
        '/set': (context) => SetPage(),
        '/timer': (context) => TimerPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }

}