// ignore_for_file: inference_failure_on_function_invocation

import 'package:core/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:step_tracker_app/app/constants/app_assets.dart';
import 'package:step_tracker_app/app/constants/app_icons.dart';
import 'package:step_tracker_app/app/localization/locale_keys.g.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service_impl.dart';
import 'package:step_tracker_app/presentation/login/view/login_screen_mixin.dart';
import 'package:step_tracker_app/presentation/login/view_model/cubit/login_cubit.dart';
import 'package:step_tracker_app/presentation/login/view_model/states/login_states.dart';
import 'package:step_tracker_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_text_button.dart';
import 'package:step_tracker_app/presentation/widgets/dialog/loading_alert_dialog.dart';
import 'package:step_tracker_app/presentation/widgets/divider/screen_divider.dart';
import 'package:step_tracker_app/presentation/widgets/inputs/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget with LoginScreenMixin<LoginScreen> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      appBar: CustomAppbar(title: LocaleKeys.login_title.tr(), centerTitle: true),
      body: BlocProvider(
        create: (_) => LoginCubit(authService: AuthServiceImpl()),
        child: SingleChildScrollView(
          child: Padding(
            padding: context.paddingPage,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: context.logoRadius,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(AppAssets.logo),
                    ),
                    CustomTextFormField(
                      textController: emailController,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      labelText: LocaleKeys.login_email.tr(),
                    ),
                    context.emptyBoxLowVertical,
                    CustomTextFormField(
                      textController: passwordController,
                      inputType: TextInputType.visiblePassword,
                      isObscure: true,
                      inputAction: TextInputAction.done,
                      labelText: LocaleKeys.login_password.tr(),
                      suffix: IconButton(
                        icon: const Icon(AppIcons.visibility),
                        onPressed: () {},
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        callbackAction: () {},
                        text: LocaleKeys.login_forgot_password.tr(),
                      ),
                    ),
                    context.emptyBoxLowVertical,
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return CustomLongElevatedButton(
                          callbackAction: () async {
                            await LoadingAlertDialog.showLoading(context);
                            await context.read<LoginCubit>().signIn('email', 'password');
                          },
                          text: LocaleKeys.login_title.tr(),
                          textColor: context.whiteColor,
                        );
                      },
                    ),
                    context.emptyBoxLowVertical,
                    ScreenDivider(middleText: LocaleKeys.login_login_or.tr(), textColor: context.blackColor),
                    context.emptyBoxLowVertical,
                    SignInButton(
                      Buttons.google,
                      onPressed: () {},
                      text: LocaleKeys.login_google_sign_in.tr(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
