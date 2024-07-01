import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/day.dart';


class DayProvider extends ChangeNotifier {

  int _counter = 0;
  int get counter => _counter;
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  int _weight = 0;
  int get weight => _weight;
  set weight(int value) {
    _weight = value;
    notifyListeners();
  }

  int _height = 0;
  int get height => _height;
  set height(int value) {
    _height = value;
    notifyListeners();
  }

  int _age = 0;
  int get age => _age;
  set age(int value) {
    _age = value;
    notifyListeners();
  }

  String _gender = "Male";
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  int _breakfast = 0;
  int get breakfast => _breakfast;
  set breakfast(int value) {
    _breakfast = value;
    notifyListeners();
  }

  int _lunch = 0;
  int get lunch => _lunch;
  set lunch(int value) {
    _lunch = value;
    notifyListeners();
  }

  int _dinner = 0;
  int get dinner => _dinner;
  set dinner(int value) {
    _dinner = value;
    notifyListeners();
  }

  int _other = 0;
  int get other => _other;
  set other(int value) {
    _other = value;
    notifyListeners();
  }

  int _hours = 0;
  int get hours => _hours;
  set hours(int value) {
    _hours = value;
    notifyListeners();
  }

  int _minutes = 0;
  int get minutes => _minutes;
  set minutes(int value) {
    _minutes = value;
    notifyListeners();
  }

  int _seconds = 0;
  int get seconds => _seconds;
  set seconds(int value) {
    _seconds = value;
    notifyListeners();
  }

  String _totalTime = "";
  String get totalTime => _totalTime;
  set totalTime(String value) {
    _totalTime = value;
    notifyListeners();
  }

  SessionReaction _reaction = SessionReaction.Excellent;
  SessionReaction get reaction => _reaction;
  set reaction(SessionReaction value) {
    _reaction = value;
    notifyListeners();
  }

  List<Day> _days = [];
  List<Day> get days => _days;
  set days(List<Day> value) {
    _days = value;
    notifyListeners();
  }
  void addDay(Day day) {
    _days.add(day);
    notifyListeners();
  }

  void saveToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();

    // await prefs.setInt('counter', _counter);
    // await prefs.setInt('weight', _weight);
    // await prefs.setInt('height', _height);
    // await prefs.setInt('age', _age);
    // await prefs.setString('gender', _gender);
    await prefs.setInt('breakfast', _breakfast);
    // await prefs.setInt('lunch', _lunch);
    // await prefs.setInt('dinner', _dinner);
    // await prefs.setInt('other', _other);
    // await prefs.setInt('hours', _hours);
    // await prefs.setInt('minutes', _minutes);
    // await prefs.setInt('seconds', _seconds);
    // await prefs.setString('totalTime', _totalTime);
    // await prefs.setString('reaction', _reaction.toString());
    // Добавить конвертацию в json для листа
  }

  void loadFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();

    // _counter = prefs.getInt('counter') ?? 0;
    // _weight = prefs.getInt('weight') ?? 0;
    // _height = prefs.getInt('height') ?? 0;
    // _age = prefs.getInt('age') ?? 0;
    // _gender = prefs.getString('gender') ?? "Male";
    _breakfast = prefs.getInt('breakfast') ?? 0;
    // _lunch = prefs.getInt('lunch') ?? 0;
    // _dinner = prefs.getInt('dinner') ?? 0;
    // _other = prefs.getInt('other') ?? 0;
    // _hours = prefs.getInt('hours') ?? 0;
    // _minutes = prefs.getInt('minutes') ?? 0;
    // _seconds = prefs.getInt('seconds') ?? 0;
    // _totalTime = prefs.getString('totalTime') ?? "";
    // _reaction = SessionReaction.values.byName(prefs.getString('reaction') ?? "Excellent");
    //добавить конвертацию из json для листа

    notifyListeners();
  }
}