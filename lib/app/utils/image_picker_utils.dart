import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _imagePicker = ImagePicker();

  /// Get image from gallery
  /// Returns image path
  Future<String?> getImagePathGallery({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    XFile? pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );
    return pickedFile?.path;
  }

  /// Get images from gallery
  /// Returns image path
  Future<List<String>?> getImagesPathGallery({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    List<XFile>? pickedFile = await _imagePicker.pickMultiImage(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );
    return pickedFile?.map((xFile) => xFile.path).toList();
  }

  /// Get image from camera
  /// Returns images list path
  Future<String?> getImagePathCamera({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    XFile? pickedFile = await _imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
      preferredCameraDevice: preferredCameraDevice,
    );
    return pickedFile?.path;
  }

  /// Get video from camera
  /// Returns video path
  Future<String?> getVideoPathCamera({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    XFile? pickedFile = await _imagePicker.pickVideo(
      source: ImageSource.camera,
      preferredCameraDevice: preferredCameraDevice,
    );
    return pickedFile?.path;
  }

  /// Get video from gallery
  /// Returns video path
  Future<String?> getVideoPathGallery({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    XFile? pickedFile = await _imagePicker.pickVideo(
      source: ImageSource.gallery,
      preferredCameraDevice: preferredCameraDevice,
    );
    return pickedFile?.path;
  }
}