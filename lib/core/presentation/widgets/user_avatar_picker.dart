import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upray_mobile/core/presentation/blocs/media_picker_bloc/media_picker_bloc.dart';
import 'package:upray_mobile/core/presentation/widgets/gap.dart';
import 'package:upray_mobile/core/utils/media_picker/media_file.dart';
import 'package:upray_mobile/core/utils/media_picker/media_picker.dart';
import 'package:upray_mobile/gen/strings.g.dart';
import 'package:upray_mobile/injection_container.dart';

class UserAvatarPicker extends StatelessWidget {
  const UserAvatarPicker({
    super.key,
    required this.onSelect,
  });

  final Function(MediaFile) onSelect;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MediaPickerBloc>(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<MediaPickerBloc, MediaPickerState>(
            listener: (context, mediaState) {
              if (mediaState is MediaPickerDataState) {
                onSelect(mediaState.mediaFile);
              }
            },
            builder: (context, mediaState) {
              return Column(
                children: [
                  CircleAvatar(
                    foregroundImage: mediaState is MediaPickerDataState ? Image.memory(mediaState.bytes).image : null,
                    radius: 100,
                    child: Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 2.0,
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 150,
                      ),
                    ),
                  ),
                  const Gap(16.0),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 180),
                    child: ElevatedButton(
                      onPressed: () => _onMediaPick(context),
                      child: Text(
                        mediaState is MediaPickerDataState ? context.t.utils.changeImage : context.t.utils.pickAPhoto,
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }

  void _onMediaPick(BuildContext context) {
    context.read<MediaPickerBloc>().add(const PickImageMediaPickerEvent(
          crop: true,
          cropShape: CropShape.circle,
        ));
  }
}
