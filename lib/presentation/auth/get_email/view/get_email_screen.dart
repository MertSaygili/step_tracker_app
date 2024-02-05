import 'package:core/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:step_tracker_app/app/localization/locale_keys.g.dart';
import 'package:step_tracker_app/presentation/auth/get_email/view/get_email_screen_mixin.dart';
import 'package:step_tracker_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_back_button.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:step_tracker_app/presentation/widgets/image/logo_circle_image.dart';
import 'package:step_tracker_app/presentation/widgets/inputs/custom_text_form_field.dart';

class GetEmailScreen extends StatelessWidget with GetEmailScreenMixin<GetEmailScreen> {
  GetEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      appBar: CustomAppbar(
        title: LocaleKeys.email_reset_password.tr(),
        centerTitle: true,
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: context.paddingPage,
        child: Column(
          children: [
            const LogoCircleImage(),
            context.emptyBoxMediumVertical,
            CustomTextFormField(
              textController: emailController,
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.done,
              labelText: LocaleKeys.login_email.tr(),
            ),
            context.emptyBoxMediumVertical,
            CustomLongElevatedButton(
              text: LocaleKeys.email_get_pincode.tr(),
              callbackAction: () {},
              textColor: context.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
