import 'package:flutter/material.dart';
import 'package:upray_mobile/core/presentation/widgets/gap.dart';
import 'package:upray_mobile/core/utils/validator.dart';
import 'package:upray_mobile/gen/strings.g.dart';

class RegisterPersonalDataInput extends StatelessWidget {
  const RegisterPersonalDataInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.auth.changeYourLife,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          context.t.auth.registerHeader,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Gap(32.0),
        TextFormField(
          autocorrect: false,
          autofillHints: const [AutofillHints.email],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: Validators.emailValidator,
          decoration: InputDecoration(
            hintText: t.auth.emailHint,
          ),
        ),
        const Gap(16.0),
        TextFormField(
          autocorrect: false,
          autofillHints: const [AutofillHints.email],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: Validators.emailValidator,
          decoration: InputDecoration(
            hintText: t.auth.passwordHint,
          ),
        ),
        const Gap(16.0),
        TextFormField(
          autocorrect: false,
          autofillHints: const [AutofillHints.email],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: Validators.emailValidator,
          decoration: InputDecoration(
            hintText: t.auth.repeatPasswordHint,
          ),
        ),
      ],
    );
  }
}
