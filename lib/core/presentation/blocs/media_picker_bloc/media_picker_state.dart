part of 'media_picker_bloc.dart';

sealed class MediaPickerState extends Equatable {
  const MediaPickerState();
}

class MediaPickerInitialState extends MediaPickerState {
  @override
  List<Object> get props => [];
}

class MediaPickerDataState extends MediaPickerState {
  final MediaFile mediaFile;
  final Uint8List bytes;

  const MediaPickerDataState({
    required this.mediaFile,
    required this.bytes,
  });

  @override
  List<Object> get props => [mediaFile, bytes];
}
