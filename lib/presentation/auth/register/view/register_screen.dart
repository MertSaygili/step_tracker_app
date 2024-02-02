import 'package:core/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:step_tracker_app/app/localization/locale_keys.g.dart';
import 'package:step_tracker_app/presentation/auth/register/view/register_screen_mixin.dart';
import 'package:step_tracker_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_back_button.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:step_tracker_app/presentation/widgets/button/double_text_button.dart';
import 'package:step_tracker_app/presentation/widgets/image/logo_circle_image.dart';
import 'package:step_tracker_app/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget with RegisterScreenMixin<RegisterScreen> {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      appBar: CustomAppbar(title: LocaleKeys.register_title.tr(), centerTitle: true, leading: const CustomBackButton()),
      body: Padding(
        padding: context.paddingPage,
        child: Center(
          child: Column(
            children: [
              const LogoCircleImage(),
              CustomTextFormField(
                textController: usernameController,
                inputType: TextInputType.name,
                inputAction: TextInputAction.next,
                labelText: LocaleKeys.register_username.tr(),
              ),
              context.emptyBoxLowVertical,
              CustomTextFormField(
                textController: emailController,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                labelText: LocaleKeys.register_email.tr(),
              ),
              context.emptyBoxLowVertical,
              CustomTextFormField(
                textController: passwordController,
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
                labelText: LocaleKeys.register_password.tr(),
              ),
              context.emptyBoxLargeVertical,
              CustomLongElevatedButton(
                callbackAction: () {},
                text: LocaleKeys.register_create_account.tr(),
                textColor: context.whiteColor,
              ),
              context.emptyBoxLargeVertical,
              DoubleTextActionButton(
                text: LocaleKeys.register_already_have_an_account.tr(),
                callbackAction: () {},
                secondText: LocaleKeys.register_login.tr(),
                secondTextColor: context.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
