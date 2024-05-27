import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upray_mobile/core/presentation/widgets/custom_text_form_field.dart';
import 'package:upray_mobile/core/presentation/widgets/gap.dart';
import 'package:upray_mobile/core/router/router.gr.dart';
import 'package:upray_mobile/core/utils/extensions.dart';
import 'package:upray_mobile/core/utils/validator.dart';
import 'package:upray_mobile/features/auth/data/models/params/log_in_params_model.dart';
import 'package:upray_mobile/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:upray_mobile/gen/strings.g.dart';
import 'package:upray_mobile/injection_container.dart';

@RoutePage()
class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Expanded(
                          child: Text(
                            t.appName,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).primaryTextTheme.displayLarge,
                          ),
                        ),
                        CustomTextFormField(
                          textLabel: context.t.auth.emailLabel,
                          controller: _emailController,
                          autocorrect: false,
                          autofillHints: const [AutofillHints.email],
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: Validators.emailValidator,
                          decoration: InputDecoration(hintText: t.auth.emailHint),
                        ),
                        const Gap(16.0),
                        CustomTextFormField(
                          textLabel: context.t.auth.passwordLabel,
                          controller: _passwordController,
                          autocorrect: false,
                          autofillHints: const [AutofillHints.password],
                          validator: Validators.emptyValidator,
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(hintText: t.auth.passwordHint),
                        ),
                        const Gap(16.0),
                        RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              text: t.auth.forgotYourPassword,
                              recognizer: TapGestureRecognizer()..onTap = () => _onForgotPassword(context)),
                        ),
                        const Gap(32.0),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () => _onSubmit(context),
                          child: Text(t.auth.signIn),
                        ),
                        const Gap(32.0),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            text: t.auth.dontHaveAnAccount,
                            children: [
                              TextSpan(
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                                text: t.auth.signUp,
                                recognizer: TapGestureRecognizer()..onTap = () => _onRegisterTap(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onForgotPassword(BuildContext context) {
    context.router.push(const RegisterRoute());
  }

  void _onRegisterTap(BuildContext context) {
    context.router.push(const RegisterRoute());
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            LogInUserAuthEvent(
              params: LogInParamsModel(
                password: _passwordController.value.text.weakHashString,
                email: _emailController.value.text,
              ),
            ),
          );
    }
  }
}
