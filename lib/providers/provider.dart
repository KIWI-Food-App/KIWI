import 'package:flutter/material.dart';
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
}