import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:upray_mobile/core/presentation/style/app_colors.dart';
import 'package:upray_mobile/core/presentation/widgets/gap.dart';
import 'package:upray_mobile/features/auth/presentation/pages/register_page_view/register_acount_data_input.dart';
import 'package:upray_mobile/features/auth/presentation/pages/register_page_view/register_personal_data_input.dart';
import 'package:upray_mobile/gen/strings.g.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final PageController _pageController;

  final _accountKey = GlobalKey<FormState>();

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
    return Scaffold(
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
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RegisterAccountDataInput(
                        formKey: _accountKey,
                        onSaved: (email, password, repeatPassword) {},
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: RegisterPersonalDataInput(),
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 2,
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
                child: ElevatedButton(
                  onPressed: () => _onButtonPressed(context),
                  child: Text(t.auth.nextStep),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onBackButtonPressed(BuildContext context) {
    if ((_pageController.page ?? 0) > 0) {
      _pageController.previousPage(
          duration: Durations.medium2, curve: Curves.ease);
    } else {
      context.router.maybePop();
    }
  }

  _onButtonPressed(BuildContext context) {
    if (_pageController.page == 0) {
      if (_accountKey.currentState!.validate()) {
        _accountKey.currentState!.save();
        _pageController.animateToPage(
          1,
          duration: Durations.medium2,
          curve: Curves.ease,
        );
      }
    }
  }
}
