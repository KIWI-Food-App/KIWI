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