import 'package:persian_datetime_picker/persian_datetime_picker.dart';

List<int> calculateDateOfIndex(int year, int month) {
  // * Calculate the position of each day in the grid for a Jalali month
  int numDaysInMonth = Jalali(year, month).monthLength;
  int firstDayOfMonth =
      Jalali(year, month, 1).weekDay; // 6 for Saturday, 7 for Sunday

  List<List<int>> grid = List.generate(6, (row) => List<int>.filled(7, 0));
  int currentDay = 1;

  for (int j = 1; j < 8; j++) {
    // * row 1 column 1 to 7
    if (j >= firstDayOfMonth) {
      grid[0][j - 1] = currentDay;
      currentDay++;
    }
  }
  for (int i = 1; i < 6; i++) {
    // * row 2 to 6

    for (int j = 1; j < 8; j++) {
      // * column 1 to 7
      if (currentDay <= numDaysInMonth) {
        grid[i][j - 1] = currentDay;
        currentDay++;
      }
    }
  }

  List<int> calender = [];

  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 7; j++) {
      calender.add(grid[i][j]);
    }
  }
  return calender;
}
