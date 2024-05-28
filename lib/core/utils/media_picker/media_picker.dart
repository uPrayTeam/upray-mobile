import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upray_mobile/core/utils/media_picker/media_file.dart';

enum PreferredCamera {
  front,
  rear;
}

enum CropShape {
  rectangle,
  circle,
}

class MediaPicker {
  final ImagePicker imagePicker;
  final ImageCropper imageCropper;

  const MediaPicker({
    required this.imagePicker,
    required this.imageCropper,
  });

  Future<MediaFile?> pickImage({
    final bool crop = false,
    final CropShape cropShape = CropShape.rectangle,
  }) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (crop) {
        final croppedFile = await imageCropper.cropImage(
            sourcePath: pickedFile.path,
            cropStyle: cropShape == CropShape.circle ? CropStyle.circle : CropStyle.rectangle);
        if (croppedFile != null) {
          final croppedXFile = XFile.fromData(
            await croppedFile.readAsBytes(),
            path: croppedFile.path,
          );

          return MediaFileModel.fromXFile(
            xFile: croppedXFile,
            mediaFileType: MediaFileType.image,
          );
        }
      }
      return MediaFileModel.fromXFile(
        xFile: pickedFile,
        mediaFileType: MediaFileType.image,
      );
    }

    return null;
  }

  Future<MediaFile?> makeAPhoto(
      {final bool crop = false,
      final PreferredCamera preferredCamera = PreferredCamera.rear,
      final CropShape cropShape = CropShape.rectangle}) async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: preferredCamera == PreferredCamera.front ? CameraDevice.front : CameraDevice.rear,
    );

    if (pickedFile != null) {
      if (crop) {
        final croppedFile = await imageCropper.cropImage(
          sourcePath: pickedFile.path,
          cropStyle: cropShape == CropShape.circle ? CropStyle.circle : CropStyle.rectangle,
        );
        if (croppedFile != null) {
          final croppedXFile = XFile.fromData(
            await croppedFile.readAsBytes(),
            path: croppedFile.path,
          );

          return MediaFileModel.fromXFile(
            xFile: croppedXFile,
            mediaFileType: MediaFileType.image,
          );
        }
      }
      return MediaFileModel.fromXFile(
        xFile: pickedFile,
        mediaFileType: MediaFileType.image,
      );
    }

    return null;
  }

  Future<MediaFile?> pickVideo() async {
    final pickedFile = await imagePicker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      return MediaFileModel.fromXFile(
        xFile: pickedFile,
        mediaFileType: MediaFileType.video,
      );
    }

    return null;
  }

  Future<MediaFile?> recordVideo({PreferredCamera preferredCamera = PreferredCamera.rear}) async {
    final pickedFile = await imagePicker.pickVideo(
      source: ImageSource.camera,
      preferredCameraDevice: preferredCamera == PreferredCamera.front ? CameraDevice.front : CameraDevice.rear,
    );

    if (pickedFile != null) {
      return MediaFileModel.fromXFile(
        xFile: pickedFile,
        mediaFileType: MediaFileType.video,
      );
    }

    return null;
  }
}
