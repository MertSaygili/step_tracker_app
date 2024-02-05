import 'package:core/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:step_tracker_app/app/injector.dart';
import 'package:step_tracker_app/app/localization/locale_keys.g.dart';
import 'package:step_tracker_app/presentation/auth/vertification/model/vertification_incoming_data_model.dart';
import 'package:step_tracker_app/presentation/auth/vertification/view/vertification_screen_mixin.dart';
import 'package:step_tracker_app/presentation/auth/vertification/view_model/cubit/vertification_cubit.dart';
import 'package:step_tracker_app/presentation/auth/vertification/view_model/states/vertification_states.dart';
import 'package:step_tracker_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_text_button.dart';
import 'package:step_tracker_app/presentation/widgets/image/logo_circle_image.dart';
import 'package:step_tracker_app/presentation/widgets/text/custom_rich_text.dart';

part './widgets/custom_otp_field.dart';

class VertificationScreen extends StatefulWidget {
  const VertificationScreen({required this.vertificationIncomingDataModel, super.key});

  final VertificationIncomingDataModel vertificationIncomingDataModel;

  @override
  State<VertificationScreen> createState() => _VertificationScreenState();
}

class _VertificationScreenState extends State<VertificationScreen> implements VertificationScreenMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VertificationCubit(
        authService: Injector.authService,
        sendMailService: Injector.sendMailService,
        vertificationIncomingDataModel: widget.vertificationIncomingDataModel,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: context.whiteColor,
        appBar: CustomAppbar(title: LocaleKeys.vertification_title.tr(), centerTitle: true),
        body: Padding(
          padding: context.paddingPage,
          child: Column(
            children: [
              const LogoCircleImage(),
              CustomRichText(
                firstText: widget.vertificationIncomingDataModel.registerDataModel?.email ?? '',
                secondText: LocaleKeys.vertification_body.tr(),
                firstTextColor: context.primaryColor,
                lineHeight: 1.5,
              ),
              context.emptyBoxLargeVertical,
              const CustomOTPField(),
              context.emptyBoxLargeVertical,
              CustomLongElevatedButton(
                text: widget.vertificationIncomingDataModel.isComingFromRegister
                    ? LocaleKeys.register_create_account.tr()
                    : LocaleKeys.reset_password_title.tr(),
                callbackAction: () {},
                textColor: context.whiteColor,
              ),
              const Spacer(),
              CustomTextButton(
                text: LocaleKeys.vertification_resend.tr(),
                callbackAction: () {},
                textColor: context.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
