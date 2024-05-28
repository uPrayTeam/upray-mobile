import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upray_mobile/core/presentation/widgets/custom_text_form_field.dart';
import 'package:upray_mobile/core/presentation/widgets/gap.dart';
import 'package:upray_mobile/core/utils/extensions.dart';
import 'package:upray_mobile/core/utils/validator.dart';
import 'package:upray_mobile/gen/strings.g.dart';

class RegisterAccountDataInput extends StatelessWidget {
  RegisterAccountDataInput({super.key, required this.onSaved, required this.formKey});

  final Function(
    String email,
    String password,
  ) onSaved;

  final GlobalKey formKey;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.auth.changeYourLife,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Gap(4.0),
          Text(
            context.t.auth.registerHeader,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  isRequired: true,
                  textLabel: context.t.auth.emailLabel,
                  autocorrect: false,
                  autofillHints: const [AutofillHints.email],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validators.emailValidator,
                  textInputAction: TextInputAction.next,
                  onSaved: (_) => _onSaved(),
                  inputFormatters: [LengthLimitingTextInputFormatter(70)],
                  decoration: InputDecoration(
                    hintText: t.auth.emailHint,
                  ),
                ),
                const Gap(16.0),
                CustomTextFormField(
                  controller: _passwordController,
                  isRequired: true,
                  textLabel: context.t.auth.passwordLabel,
                  autocorrect: false,
                  autofillHints: const [AutofillHints.email],
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validators.passwordValidator,
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: t.auth.passwordHint,
                  ),
                ),
                const Gap(16.0),
                CustomTextFormField(
                  controller: _repeatPasswordController,
                  isRequired: true,
                  textLabel: context.t.auth.repeatPasswordLabel,
                  autocorrect: false,
                  autofillHints: const [AutofillHints.email],
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  validator: (value) => Validators.repeatPasswordValidator(
                    value,
                    _passwordController.value.text,
                  ),
                  decoration: InputDecoration(
                    hintText: t.auth.repeatPasswordHint,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _onSaved() {
    onSaved.call(
      _emailController.value.text.trim(),
      _passwordController.value.text.weakHashString,
    );
  }
}
