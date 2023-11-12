import 'package:intl/intl.dart';

class DateAndTime {
  DateTime startTime;

  DateAndTime({required this.startTime});

  String formattedHour() {
    return DateFormat('kk:mm').format(startTime);
  }

  String formattedDayW() {
    return DateFormat('EEE').format(startTime);
  }

  String formattedDay() {
    return DateFormat('dd').format(startTime);
  }

  String formattedStartTime() {
    return DateFormat('kk:mm \n EEE dd MMM').format(startTime);
  }
}

List<DateAndTime> hours = [
  DateAndTime(startTime: DateTime(2023, 11, 12, 15, 30)),
  DateAndTime(startTime: DateTime(2023, 11, 10, 14, 0)),
  DateAndTime(startTime: DateTime(2023, 11, 31, 13, 30)),
  DateAndTime(startTime: DateTime(2023, 11, 05, 13, 30)),
];
