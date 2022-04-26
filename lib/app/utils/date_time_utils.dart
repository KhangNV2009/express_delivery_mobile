import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static const DD_MM_YYYY_SLASH = "dd/MM/yyyy";
  static const DD_MM_YYYY_FEED_BACK = "dd.MM.yyyy";
  static const HH_MM_COLON = "HH:mm";
  static const WEEKDAY_OF_WEEK_SHORT = "E";
  static const WEEKDAY_OF_WEEK_FULL = "EEEE";
  static const WEEKDAY_OF_WEEK = "EEEE, dd - MMMM";
  static const CHAT_FORMAT = "hh:mm a - dd.MM.yyyy";
  static const NOTIFICATION_FORMAT_FOR_VN = "dd/MM/yyyy hh:mm a";
  static const NOTIFICATION_FORMAT_FOR_EN = "MMMM dd, yyyy hh:mm a";
  static const MY_POST_FORMAT = "hh:mm - dd/MM/yyyy";
  static const VERSION_DATE_FORMAT = "yyyy.MM.dd.hh.mm.ss";
  static const YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

  static const DEFAULT_VERSION_DATE_STRING = "2020.01.01.00.00.00";
  static const DEFAULT_DATE_TIME_TO_RESPONSE_SERVER = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static const CONDITION_DATETIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss";
  static const DD_MMM_YYYY_WITH_COMMA = "dd MMM, yyyy";
  static const DAY_OF_MONTH = "dd";
  static const DAY_AND_MONTH = "dd/MM";
  static const MONTH_AND_YEAR = "MM/yyyy";

  static DateTime convertStringToDate(String dateString, {String format: DD_MM_YYYY_SLASH}) {
    return DateFormat(format).parse(dateString, true);
  }

  static String convertDateTimeToString(DateTime date, {String format: DD_MM_YYYY_SLASH}) {
    return formatDate(date, format: format);
  }

  static String formatDate(DateTime date, {String format: DD_MM_YYYY_SLASH, bool isUTC = true}) {
    var dateFormat = DateFormat(format, Get.locale?.languageCode);
    return dateFormat.format(isUTC ? date.toLocal() : date);
  }

  static String parseToTime(String time) {
    final dateTime = DateTimeUtils.convertStringToDate(time, format: DateTimeUtils.DEFAULT_DATE_TIME_TO_RESPONSE_SERVER);
    final timeStr = DateTimeUtils.convertDateTimeToString(dateTime, format: DateTimeUtils.HH_MM_COLON);
    return timeStr;
  }

  static String parseToDate(String time) {
    final dateTime = DateTimeUtils.convertStringToDate(time, format: DateTimeUtils.DEFAULT_DATE_TIME_TO_RESPONSE_SERVER);
    final timeStr = DateTimeUtils.convertDateTimeToString(dateTime, format: DateTimeUtils.DD_MM_YYYY_SLASH);
    return timeStr;
  }

  static String parseToDateTime(String time) {
    final dateTime = DateTimeUtils.convertStringToDate(time, format: DateTimeUtils.DEFAULT_DATE_TIME_TO_RESPONSE_SERVER);
    final timeStr = DateTimeUtils.convertDateTimeToString(dateTime, format: DateTimeUtils.NOTIFICATION_FORMAT_FOR_VN);
    return timeStr;
  }
}
