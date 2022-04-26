import 'dart:ui';

import 'package:get/get.dart';

import '../../utils/app_strings.dart';
import '../storage/core_storage_manager.dart';

class LanguageService {
  /// Get language info from local storage and return Locale
  Locale get language => getLocaleByString(CoreStorageManager().getLanguage());

  /// Change language and save to local storage
  void changeLanguage(String localeString) {
    final locale = getLocaleByString(localeString);
    Get.updateLocale(locale);
    CoreStorageManager().setLanguage(localeString);
  }

  Locale getLocaleByString(String localeString) {
    switch (localeString) {
      case Strings.ENGLISH:
        return Locale('en', 'US');
      case Strings.VIETNAMESE:
        return Locale('vi', 'VN');
      default:
        return Locale('vi', 'VN');
    }
  }
}