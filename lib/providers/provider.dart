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

//- - - - - - - - - -
  Future<void> saveDay(Day day) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = dayToJson(day);
  await prefs.setString('day', jsonString);
}

Future<Day?> loadDay() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('day');
  if (jsonString != null) {
    return dayFromJson(jsonString);
  } else {
    return null;
  }
}

Future<void> saveDays(List<Day> days) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonStrings = days.map((day) => dayToJson(day)).toList();
  await prefs.setStringList('days', jsonStrings);
}

Future<List<Day>> loadDays() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonStrings = prefs.getStringList('days');
  if (jsonStrings != null) {
    return jsonStrings.map((jsonString) => dayFromJson(jsonString)).toList();
  } else {
    return [];
  }
}

//- - - - - - - - - -

  void saveDayToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('breakfast', _breakfast);
    await prefs.setInt('lunch', _lunch);
    await prefs.setInt('dinner', _dinner);
    await prefs.setInt('other', _other);
  }

  // void loadDayFromLocalStorage() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   _breakfast = prefs.getInt('breakfast') ?? 0;
  //   _lunch = prefs.getInt('lunch') ?? 0;
  //   _dinner = prefs.getInt('dinner') ?? 0;
  //   _other = prefs.getInt('other') ?? 0;
  //   notifyListeners();
  // }

  void resetDay() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('breakfast', 0);
    await prefs.setInt('lunch', 0);
    await prefs.setInt('dinner', 0);
    await prefs.setInt('other', 0);
  }

  void saveSignToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('weight', _weight);
    await prefs.setInt('height', _height);
    await prefs.setInt('age', _age);
    await prefs.setString('gender', _gender);
  }

  // void loadSignFromLocalStorage() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   _weight = prefs.getInt('weight') ?? 0;
  //   _height = prefs.getInt('height') ?? 0;
  //   _age = prefs.getInt('age') ?? 0;
  //   _gender = prefs.getString('gender') ?? "Male";
  //   notifyListeners();
  // }

  void saveTimeToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('hours', _hours);
    await prefs.setInt('minutes', _minutes);
    await prefs.setInt('seconds', _seconds);
    await prefs.setString('totalTime', _totalTime);
  }
}