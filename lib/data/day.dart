import 'dart:convert';

class Day {
  final int counter;
  final int breakfast;
  final int lunch;
  final int dinner;
  final int other;
  final String totalTime;
  final SessionReaction reaction;

  Day(
    this.counter,
    this.breakfast, 
    this.lunch, 
    this.dinner, 
    this.other, 
    this.totalTime, 
    this.reaction);

    Map<String, dynamic> toJson() {
    return {
      'counter': counter,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'other': other,
      'totalTime': totalTime,
      'reaction': reaction.toString(),
    };
  }
}


String dayToJson(Day day) {
  return jsonEncode(day.toJson());
}

Day dayFromJson(String jsonString) {
    final parsedJson = json.decode(jsonString);
    return Day(
      parsedJson['counter'],
      parsedJson['breakfast'],
      parsedJson['lunch'],
      parsedJson['dinner'],
      parsedJson['other'],
      parsedJson['totalTime'],
      parsedJson['reaction']
    );
  }


enum Gender {
  Male,
  Female
}

enum SessionReaction {
  Excellent,
  Good,
  Neutral,
  Bad
}