import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upray_mobile/core/utils/media_picker/media_file.dart';
import 'package:upray_mobile/core/utils/media_picker/media_picker.dart';

part 'media_picker_event.dart';
part 'media_picker_state.dart';

class MediaPickerBloc extends Bloc<MediaPickerEvent, MediaPickerState> {
  MediaPickerBloc({required this.mediaPicker}) : super(MediaPickerInitialState()) {
    on<PickImageMediaPickerEvent>(_onPickImage);
    on<MakePhotoMediaPickerEvent>(_onMakePhoto);
    on<PickVideoMediaPickerEvent>(_onPickVideo);
    on<RecordVideoMediaPickerEvent>(_onRecordVideo);
  }

  final MediaPicker mediaPicker;

  void _onPickImage(PickImageMediaPickerEvent event, Emitter emit) async {
    final result = await mediaPicker.pickImage(
      crop: event.crop,
      cropShape: event.cropShape,
    );

    if (result != null) {
      emit(MediaPickerDataState(
        mediaFile: result,
        bytes: await result.bytes!,
      ));
    }
  }

  void _onMakePhoto(MakePhotoMediaPickerEvent event, Emitter emit) async {
    final result = await mediaPicker.makeAPhoto(
      crop: event.crop,
      preferredCamera: event.preferredCamera,
      cropShape: event.cropShape,
    );

    if (result != null) {
      emit(MediaPickerDataState(
        mediaFile: result,
        bytes: await result.bytes!,
      ));
    }
  }

  void _onPickVideo(PickVideoMediaPickerEvent event, Emitter emit) async {
    final result = await mediaPicker.pickVideo();

    if (result != null) {
      emit(MediaPickerDataState(
        mediaFile: result,
        bytes: await result.bytes!,
      ));
    }
  }

  void _onRecordVideo(RecordVideoMediaPickerEvent event, Emitter emit) async {
    final result = await mediaPicker.recordVideo(
      preferredCamera: event.preferredCamera,
    );

    if (result != null) {
      emit(MediaPickerDataState(
        mediaFile: result,
        bytes: await result.bytes!,
      ));
    }
  }
}
