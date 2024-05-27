part of 'media_picker_bloc.dart';

sealed class MediaPickerEvent extends Equatable {
  const MediaPickerEvent();
}

class PickImageMediaPickerEvent extends MediaPickerEvent {
  final bool crop;
  final CropShape cropShape;

  @override
  List<Object> get props => [crop];

  const PickImageMediaPickerEvent({
    this.crop = false,
    this.cropShape = CropShape.rectangle,
  });
}

class MakePhotoMediaPickerEvent extends MediaPickerEvent {
  final PreferredCamera preferredCamera;
  final bool crop;
  final CropShape cropShape;

  @override
  List<Object> get props => [preferredCamera];

  const MakePhotoMediaPickerEvent({
    this.preferredCamera = PreferredCamera.rear,
    this.crop = false,
    this.cropShape = CropShape.rectangle,
  });
}

class PickVideoMediaPickerEvent extends MediaPickerEvent {
  @override
  List<Object> get props => [];
}

class RecordVideoMediaPickerEvent extends MediaPickerEvent {
  final PreferredCamera preferredCamera;

  @override
  List<Object> get props => [preferredCamera];

  const RecordVideoMediaPickerEvent({
    this.preferredCamera = PreferredCamera.rear,
  });
}
