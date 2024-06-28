class Day {
  final int weight;
  final int height;
  final int age;
  final String gender;
  final int breakfast;
  final int lunch;
  final int dinner;
  final int other;
  final int hours;
  final int minutes;
  final int seconds;
  final int totalTime;
  final SessionReaction reaction;

  Day(
    this.weight, 
    this.height, 
    this.age, 
    this.gender, 
    this.breakfast, 
    this.lunch, 
    this.dinner, 
    this.other, 
    this.hours, 
    this.minutes, 
    this.seconds, 
    this.totalTime, 
    this.reaction);
}


enum SessionReaction {
  Excellent,
  Good,
  Neutral,
  Bad
}