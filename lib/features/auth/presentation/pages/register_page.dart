import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:upray_mobile/core/presentation/style/app_colors.dart';
import 'package:upray_mobile/core/presentation/widgets/gap.dart';
import 'package:upray_mobile/core/utils/media_picker/media_file.dart';
import 'package:upray_mobile/features/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:upray_mobile/features/auth/presentation/pages/register_page_view/register_acount_data_input.dart';
import 'package:upray_mobile/features/auth/presentation/pages/register_page_view/register_avatar_input.dart';
import 'package:upray_mobile/features/auth/presentation/pages/register_page_view/register_personal_data_input.dart';
import 'package:upray_mobile/gen/strings.g.dart';
import 'package:upray_mobile/injection_container.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final PageController _pageController;

  final _accountKey = GlobalKey<FormState>();
  final _personalKey = GlobalKey<FormState>();
  final ValueNotifier<int> _page = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(context.t.auth.createNewAccount),
            leading: BackButton(
              onPressed: () => _onBackButtonPressed(context),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      onPageChanged: (currentPage) => _page.value = currentPage,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: RegisterAccountDataInput(
                            formKey: _accountKey,
                            onSaved: (email, password) => _onAccountSave(
                              context,
                              email: email,
                              password: password,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: RegisterPersonalDataInput(
                            formKey: _personalKey,
                            onSaved: (String? firstName, String? lastName, DateTime? dateOfBirth) => _onPersonalSaved(
                              context,
                              firstName: firstName,
                              lastName: lastName,
                              dateOfBirth: dateOfBirth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: RegisterAvatarInput(
                            onPicked: (mediaFile) => _onAvatarPicked(context, mediaFile: mediaFile),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: JumpingDotEffect(
                      verticalOffset: 10.0,
                      activeDotColor: Theme.of(context).colorScheme.secondary,
                      dotColor: AppColors.lightGray,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                    ),
                  ),
                  const Gap(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ValueListenableBuilder<int>(
                      builder: (context, page, _) {
                        return ElevatedButton(
                          onPressed: () => page == 2 ? _onRegister(context) : _onNextButtonPressed(context),
                          child: Text(
                            page == 2 ? context.t.auth.signUp : context.t.auth.nextStep,
                          ),
                        );
                      },
                      valueListenable: _page,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  _onAccountSave(
    BuildContext context, {
    required final String email,
    required final String password,
  }) =>
      context.read<RegisterBloc>().add(
            AddAccountDataRegisterEvent(
              email: email,
              password: password,
            ),
          );

  _onPersonalSaved(
    BuildContext context, {
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
  }) =>
      context.read<RegisterBloc>().add(
            AddPersonalDataRegisterEvent(
              firstName: firstName,
              lastName: lastName,
              dateOfBirth: dateOfBirth,
            ),
          );

  _onAvatarPicked(BuildContext context, {required final MediaFile mediaFile}) {
    context.read<RegisterBloc>().add(AddUserAvatarRegisterEvent(userAvatar: mediaFile));
  }

  _onBackButtonPressed(BuildContext context) {
    if ((_pageController.page ?? 0) > 0) {
      _pageController.previousPage(
        duration: Durations.medium2,
        curve: Curves.ease,
      );
    } else {
      context.router.maybePop();
    }
  }

  _onNextButtonPressed(BuildContext context) {
    if (_pageController.page == 0) {
      if (_accountKey.currentState!.validate()) {
        _accountKey.currentState!.save();
        _pageController.nextPage(
          duration: Durations.medium2,
          curve: Curves.ease,
        );
      }
    } else if (_pageController.page == 1) {
      _personalKey.currentState!.save();
      _pageController.nextPage(
        duration: Durations.medium2,
        curve: Curves.ease,
      );
    }
  }

  _onRegister(BuildContext context) {
    context.read<RegisterBloc>().add(RegisterUserEvent());
  }
}
