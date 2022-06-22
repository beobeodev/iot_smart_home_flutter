import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get toFullDate {
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(this);
  }
}
