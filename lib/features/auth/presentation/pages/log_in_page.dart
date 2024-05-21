import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upray_mobile/core/presentation/style/custom_textfield_decoration.dart';
import 'package:upray_mobile/core/presentation/widgets/gap.dart';
import 'package:upray_mobile/core/utils/extensions.dart';
import 'package:upray_mobile/core/utils/validator.dart';
import 'package:upray_mobile/features/auth/data/models/params/log_in_params_model.dart';
import 'package:upray_mobile/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
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
      create: (context) => sl<AuthBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const CustomTextfieldDecoration(),
                      controller: _emailController,
                      validator: Validators.emailValidator,
                    ),
                    const Gap(16.0),
                    TextFormField(
                      decoration: const CustomTextfieldDecoration(),
                      controller: _passwordController,
                      validator: Validators.emptyValidator,
                      obscureText: true,
                    ),
                    const Gap(32.0),
                    ElevatedButton(
                        onPressed: () => _onSubmit(context),
                        child: Text(t.auth.signIn)),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            LogInUserAuthEvent(
              params: LogInParamsModel(
                password: _passwordController.value.text.hashString,
                email: _emailController.value.text,
              ),
            ),
          );
    }
  }
}
