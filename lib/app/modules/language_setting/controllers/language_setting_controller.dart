import 'package:get/get.dart';

import '../../../data/storage/core_storage_manager.dart';
import '../../../utils/app_strings.dart';

class LanguageSettingController extends GetxController {
  final isVietnameseEnable = false.obs;
  final isEnglishEnable = false.obs;

  @override
  void onInit() {
    super.onInit();
    onInitData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onInitData() {
    isVietnameseEnable.value = CoreStorageManager().getLanguage() == Strings.VIETNAMESE;
    isEnglishEnable.value = CoreStorageManager().getLanguage() == Strings.ENGLISH;
  }

  Future<bool> onBackPressed() {
    return Future.value(true);
  }
}
