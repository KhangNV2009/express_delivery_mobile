import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:express_delivery/app/utils/strings_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_native_image/flutter_native_image.dart';

import '../components/base_shimmer.dart';

class ImageUtils {
  ///Load image from url with width and height
  Widget loadImageUrl({
    required String imageUrl,
    required double width,
    required double height,
    String? blurHash,
    Widget? placeHolder,
    Widget? errorImage,
    BoxFit? boxFit,
  }) {
    if (placeHolder == null) {
      if (blurHash?.isEmpty == true) {
        blurHash = StringUtils.getBlurHash(imageUrl);
        placeHolder = BaseShimmer(width: width, height: height);
      } else {
        placeHolder = Container(
          width: width,
          height: height,
          child: BlurHash(
            hash: blurHash ?? '',
            imageFit: boxFit ?? BoxFit.fill,
            duration: const Duration(milliseconds: 500),
          ),
        );
      }
    }

    errorImage ??= Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Icon(
        Icons.image_not_supported_outlined,
        color: Colors.white,
        size: width * 0.75,
      ),
    );

    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) {
        return placeHolder ?? const SizedBox();
      },
      errorWidget: (context, url, error) {
        return errorImage ?? const SizedBox();
      },
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.cover,
    );
  }

  static void compress(File _image, Function(File compressImage) onComplete) async {
    ImageProperties properties = await FlutterNativeImage.getImageProperties(_image.path);
    File compressedFile = await FlutterNativeImage.compressImage(
      _image.path,
      quality: 80,
      targetWidth: 600,
      targetHeight: (properties.height! * 600 / properties.width!).round(),
    );
    onComplete(compressedFile);
  }

  static Future<File> compressWithPath(
    String filePath, {
    percentage = 80,
    quality = 80,
    targetWidth = 600,
  }) async {
    ImageProperties properties = await FlutterNativeImage.getImageProperties(filePath);
    File compressedFile = await FlutterNativeImage.compressImage(
      filePath,
      percentage: percentage,
      quality: quality,
      targetWidth: targetWidth,
      targetHeight: (properties.height! * targetWidth / properties.width!).round(),
    );
    return compressedFile;
  }
}
