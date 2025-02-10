part of '../ultimate_extension.dart';

extension DateExtension on DateTime {
  String timeAgoFromNow() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays >= 365) {
      return difference.inDays ~/ 365 == 1
          ? '1 year ago'
          : '${difference.inDays ~/ 365} years ago';
    } else if (difference.inDays >= 30) {
      return difference.inDays ~/ 30 == 1
          ? '1 month ago'
          : '${difference.inDays ~/ 30} months ago';
    } else if (difference.inDays >= 7) {
      return difference.inDays ~/ 7 == 1
          ? '1 week ago'
          : '${difference.inDays ~/ 7} weeks ago';
    } else if (difference.inDays >= 1) {
      return difference.inDays == 1
          ? '1 day ago'
          : '${difference.inDays} days ago';
    } else if (difference.inHours >= 1) {
      return difference.inHours == 1
          ? '1 hour ago'
          : '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return difference.inMinutes == 1
          ? '1 minute ago'
          : '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  bool isLeapYear() {
    int year = this.year;

    if (year % 4 != 0) {
      /// Not divisible by 4, not a leap year
      return false;
    } else if (year % 100 != 0) {
      /// Divisible by 4 but not by 100, it is a leap year
      return true;
    } else if (year % 400 != 0) {
      /// Divisible by 100 but not by 400, not a leap year
      return false;
    } else {
      /// Divisible by 400, it is a leap year
      return true;
    }
  }

  int get calculateAge {
    final today = DateTime.now();
    int age = today.year - year;

    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }

    return age;
  }

  /// Format DateTime as 24-Hour Time: HH:MM:SS
  String to24HourTime({bool includeSeconds = false}) {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}${includeSeconds ? second.toString().padLeft(2, '0') : ""}';
  }

  /// Format DateTime as 12-Hour Time with AM/PM: hh:MM:SS AM/PM
  String to12HourTime({bool includeSeconds = false}) {
    String period = this.hour < 12 ? 'AM' : 'PM';
    int hour = this.hour % 12 == 0 ? 12 : this.hour % 12;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${includeSeconds ? second.toString().padLeft(2, '0') : ""} $period';
  }
}
