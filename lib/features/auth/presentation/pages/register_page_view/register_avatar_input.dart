import 'package:flutter/material.dart';
import 'package:upray_mobile/core/presentation/widgets/gap.dart';
import 'package:upray_mobile/core/presentation/widgets/user_avatar_picker.dart';
import 'package:upray_mobile/core/utils/media_picker/media_file.dart';
import 'package:upray_mobile/gen/strings.g.dart';

class RegisterAvatarInput extends StatelessWidget {
  const RegisterAvatarInput({super.key, required this.onPicked});

  final Function(MediaFile mediaFile) onPicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.auth.avatarQuote,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const Gap(4.0),
        Text(
          context.t.auth.avatarHeader,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Gap(40.0),
        Center(
          child: UserAvatarPicker(
            onSelect: onPicked,
          ),
        ),
      ],
    );
  }
}
