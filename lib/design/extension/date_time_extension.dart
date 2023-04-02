import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {}

class DateTimeUtil {
  static String toDateTimeString(
      {required String format, required DateTime? dateTime}) {
    if (dateTime == null) return '';

    final dateFormat = DateFormat(format);
    return dateFormat.format(dateTime);
  }
}
