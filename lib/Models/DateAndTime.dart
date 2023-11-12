import 'package:intl/intl.dart';

class DateAndTime {
  final DateTime startTime;

  DateAndTime({required this.startTime});

  String formattedStartTime() {
    return DateFormat('kk:mm:ss \n EEE d MMM').format(startTime);
  }
}
