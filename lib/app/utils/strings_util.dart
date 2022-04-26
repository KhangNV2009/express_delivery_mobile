import 'package:express_delivery/app/utils/list_extension.dart';

import '../constants/app_constants.dart';

class StringUtils {
  static String getFullImagePath(String? imageUrl) {
    if (imageUrl == null) return "";
    if (isRemoteUrl(imageUrl)) {
      return imageUrl;
    }
    var imagePath = getImagePath();
    if (!imagePath.endsWith("%2F") && !imageUrl.startsWith("%2F")) {
      imageUrl = "%2F$imageUrl";
    }

    ///Remove blur hash from image
    final stringArr = imageUrl.split('?blurHash=');
    imageUrl = stringArr.first;
    ///

    imagePath = "$imagePath$imageUrl";
    if (!imagePath.endsWith("?alt=media")) {
      imagePath = "$imagePath?alt=media";
    }
    return imagePath;
  }

  static String getBlurHash(String imageUrl) {
    if (!imageUrl.contains('?blurHash=')) {
      return '';
    }
    final stringArr = imageUrl.split('?blurHash=');
    if (stringArr.length > 1) {
      return stringArr[1];
    }
    return '';
  }

  static String getImagePath() {
    // return CoreRemoteConstants.imagePath;
    return '';
  }
  static bool isRemoteUrl(String imageUrl) {
    return imageUrl.startsWith("https://") || imageUrl.startsWith("http://");
  }

  String withoutToneMarks() {/// Convert Vietnamese text to text tone marks
    return "${this}".toLowerCase().replaceAllMapped(AppConstants.REGEX_CONVERT_VN_TO_ENG_WORD, (match) {
      if (match.group(0) == "đ") {
        return "d";
      }
      if (match.group(1) != null) {
        return "a";
      }

      if (match.group(2) != null) {
        return "e";
      }

      if (match.group(3) != null) {
        return "i";
      }

      if (match.group(4) != null) {
        return "o";
      }

      if (match.group(5) != null) {
        return "u";
      }

      if (match.group(6) != null) {
        return "y";
      }
      return match.group(0) ?? '';
    });
  }

  String toSearchWord() {///Add space in start and end to search by word
    return ' $this ';
  }

  String getNameShortCode(String text, [int numberShortCode = 2]) {
    if (text.isEmpty) {
      return '';
    }
    final List<String> words = text.split(' ');
    if (words.length == 1) {
      return text[0].toString().toUpperCase();
    }
    return words.take(numberShortCode).toList().foldWithIndex<String>('', (index, length, previousValue, element) {
      return previousValue.toUpperCase() + element[0];
    });
  }
}