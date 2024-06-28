import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        '/': (context) => Welkome_page(),
        '/intro1': (context) => Intro_1_page(),
        '/intro2': (context) => Intro_2_page(),
        '/intro3': (context) => Intro_3_page(),
        '/sign': (context) => Sign_page(),
        //доделать
      },
    );
  }

}