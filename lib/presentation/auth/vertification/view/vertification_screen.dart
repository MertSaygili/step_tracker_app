import 'package:core/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:step_tracker_app/app/constants/app_routers.dart';
import 'package:step_tracker_app/app/injector.dart';
import 'package:step_tracker_app/app/localization/locale_keys.g.dart';
import 'package:step_tracker_app/presentation/auth/vertification/model/vertification_incoming_data_model.dart';
import 'package:step_tracker_app/presentation/auth/vertification/view/vertification_screen_mixin.dart';
import 'package:step_tracker_app/presentation/auth/vertification/view_model/cubit/vertification_cubit.dart';
import 'package:step_tracker_app/presentation/auth/vertification/view_model/states/vertification_states.dart';
import 'package:step_tracker_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_text_button.dart';
import 'package:step_tracker_app/presentation/widgets/dialog/loading_alert_dialog.dart';
import 'package:step_tracker_app/presentation/widgets/image/logo_circle_image.dart';
import 'package:step_tracker_app/presentation/widgets/text/custom_rich_text.dart';

part './widgets/action_button.dart';
part './widgets/custom_otp_field.dart';
part './widgets/resend_pincode_button.dart';

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
      child: _listener(),
    );
  }

  BlocListener<VertificationCubit, VertificationStates> _listener() {
    return BlocListener<VertificationCubit, VertificationStates>(
      listenWhen: (previous, current) {
        if (current.isLoading) {
          LoadingAlertDialog.showLoading(context);
        }
        if (previous.isLoading && current.errorOccur) {
          Navigator.of(context).pop();
        }
        return true;
      },
      listener: (context, state) {
        if (state.emailSended) {
          Fluttertoast.showToast(msg: LocaleKeys.toast_messages_mail_send.tr());
        }
        if (state.errorOccur) {
          Fluttertoast.showToast(msg: state.errorText);
        }
        if (state.registerSuccess) {
          Fluttertoast.showToast(msg: LocaleKeys.toast_messages_register_success.tr());
          context.go(AppRouters.loginPath);
        }
        if (state.pushToResetPassword) {
          // push to reset password
        }
      },
      child: _Body(widget: widget),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.widget});

  final VertificationScreen widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ActionButton(vertificationIncomingDataModel: widget.vertificationIncomingDataModel),
            const Spacer(),
            const ResendPincodeButton(),
          ],
        ),
      ),
    );
  }
}
