import 'package:intl/intl.dart';

class DateUtils {
  static String formatDate(String date, String format) {
    DateTime dateTime = DateTime.parse(date);
    var formatter = DateFormat(format);
    return formatter.format(dateTime);
  }
}
