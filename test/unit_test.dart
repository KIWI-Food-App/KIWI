import 'package:flutter_test/flutter_test.dart';
import '../lib/pages/timer_page.dart';
import '../lib/pages/day_page.dart';
import '../lib/pages/list_page.dart';

bool isValidEmail(String route) {
  if (route.contains('/')) {
    if (route.split('/')[0] == '' && route.split('/')[1].length > 0) {
      if (route.split('/')[1].contains('_')) {
        if (route.split('/')[1].split('_')[1].contains('page')) {
          return true;
        }
      }
    }
  }
  return false;
}

void main() {
  group('Email Validation', () {
    test('Test 1', () {
      expect(isValidEmail(TimerPage.routeName), true);
    });

    test('Test 2', () {
      expect(isValidEmail(DayPage.routeName), true);
    });

    test('Test 3', () {
      expect(isValidEmail(ListPage.routeName), true);
    });
  });
}
