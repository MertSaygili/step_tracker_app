// ignore_for_file: inference_failure_on_function_invocation, unnecessary_statements

import 'package:core/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:step_tracker_app/app/constants/app_assets.dart';
import 'package:step_tracker_app/app/constants/app_icons.dart';
import 'package:step_tracker_app/app/constants/app_routers.dart';
import 'package:step_tracker_app/app/injector.dart';
import 'package:step_tracker_app/app/localization/locale_keys.g.dart';
import 'package:step_tracker_app/presentation/login/view/login_screen_mixin.dart';
import 'package:step_tracker_app/presentation/login/view_model/cubit/login_cubit.dart';
import 'package:step_tracker_app/presentation/login/view_model/states/login_states.dart';
import 'package:step_tracker_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_text_button.dart';
import 'package:step_tracker_app/presentation/widgets/button/double_text_button.dart';
import 'package:step_tracker_app/presentation/widgets/dialog/loading_alert_dialog.dart';
import 'package:step_tracker_app/presentation/widgets/divider/screen_divider.dart';
import 'package:step_tracker_app/presentation/widgets/inputs/custom_text_form_field.dart';

part 'widgets/password_textfield.dart';
part 'widgets/sign_in_button.dart';

class LoginScreen extends StatelessWidget with LoginScreenMixin<LoginScreen> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      appBar: CustomAppbar(title: LocaleKeys.login_title.tr(), centerTitle: true),
      body: BlocProvider(
        create: (_) => LoginCubit(authService: Injector.authService, screenContext: context),
        child: _Body(emailController: emailController, passwordController: passwordController),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingPage,
        child: BlocListener<LoginCubit, LoginState>(
          listenWhen: (previous, current) {
            if (current.isLoading) {
              LoadingAlertDialog.showLoading(context);
            }
            if (previous.isLoading && current.errorOccur) {
              Navigator.of(context).pop();
              Fluttertoast.showToast(msg: LocaleKeys.toast_messages_login_error.tr());
            }
            return true;
          },
          listener: (context, state) {
            if (state.loginSuccess) {
              Fluttertoast.showToast(msg: LocaleKeys.toast_messages_login_success.tr());
              context.goNamed(AppRouters.registerName);
            }
          },
          child: _ChildBody(emailController: emailController, passwordController: passwordController),
        ),
      ),
    );
  }
}

class _ChildBody extends StatelessWidget {
  const _ChildBody({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: context.logoRadius,
          backgroundColor: context.transparentColor,
          child: Image.asset(AppAssets.logo),
        ),
        CustomTextFormField(
          textController: emailController,
          inputType: TextInputType.emailAddress,
          inputAction: TextInputAction.next,
          labelText: LocaleKeys.login_email.tr(),
        ),
        context.emptyBoxLowVertical,
        _PasswordTextField(passwordController: passwordController),
        Align(
          alignment: Alignment.centerRight,
          child: CustomTextButton(
            callbackAction: () {
              // forgot password
            },
            text: LocaleKeys.login_forgot_password.tr(),
          ),
        ),
        context.emptyBoxLowVertical,
        _SignInButton(emailController: emailController, passwordController: passwordController),
        context.emptyBoxLowVertical,
        ScreenDivider(middleText: LocaleKeys.login_login_or.tr(), textColor: context.blackColor),
        context.emptyBoxLowVertical,
        SignInButton(
          Buttons.google,
          onPressed: () async {
            await context.read<LoginCubit>().googleSignIn();
          },
          text: LocaleKeys.login_google_sign_in.tr(),
        ),
        context.emptyBoxLargeVertical,
        DoubleTextActionButton(
          text: LocaleKeys.login_you_dont_have_an_account.tr(),
          secondText: LocaleKeys.login_create_account.tr(),
          secondTextColor: context.primaryColor,
          callbackAction: () {},
        ),
      ],
    );
  }
}
