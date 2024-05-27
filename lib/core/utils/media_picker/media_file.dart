import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

enum MediaFileType {
  image,
  video;
}

abstract class MediaFile extends Equatable {
  String get path;

  String? get mimeType;

  String? get name;

  int? get length;

  Future<Uint8List>? get bytes;

  Future<DateTime>? get lastModified;

  MediaFileType get mediaFileType;
}

class MediaFileModel extends MediaFile {
  MediaFileModel({
    required this.path,
    required this.mediaFileType,
    this.mimeType,
    this.name,
    this.length,
    this.bytes,
    this.lastModified,
  });

  factory MediaFileModel.fromXFile({
    required XFile xFile,
    required MediaFileType mediaFileType,
  }) {
    return MediaFileModel(
      path: xFile.path,
      mimeType: xFile.mimeType,
      name: xFile.name,
      bytes: xFile.readAsBytes(),
      lastModified: xFile.lastModified(),
      mediaFileType: mediaFileType,
    );
  }

  @override
  final String path;

  @override
  final String? mimeType;

  @override
  final String? name;

  @override
  final int? length;

  @override
  final Future<Uint8List>? bytes;

  @override
  final Future<DateTime>? lastModified;

  @override
  final MediaFileType mediaFileType;

  @override
  List<Object?> get props => [
        path,
        mimeType,
        name,
        length,
        bytes,
        lastModified,
        mediaFileType,
      ];
}
