import 'package:core/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:step_tracker_app/app/constants/app_icons.dart';
import 'package:step_tracker_app/app/constants/app_routers.dart';
import 'package:step_tracker_app/app/injector.dart';
import 'package:step_tracker_app/app/localization/locale_keys.g.dart';
import 'package:step_tracker_app/presentation/auth/register/model/register_data_model.dart';
import 'package:step_tracker_app/presentation/auth/register/view/register_screen_mixin.dart';
import 'package:step_tracker_app/presentation/auth/register/view_model/cubit/register_cubit.dart';
import 'package:step_tracker_app/presentation/auth/register/view_model/states/register_state.dart';
import 'package:step_tracker_app/presentation/auth/vertification/model/vertification_incoming_data_model.dart';
import 'package:step_tracker_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_back_button.dart';
import 'package:step_tracker_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:step_tracker_app/presentation/widgets/button/double_text_button.dart';
import 'package:step_tracker_app/presentation/widgets/dialog/loading_alert_dialog.dart';
import 'package:step_tracker_app/presentation/widgets/image/logo_circle_image.dart';
import 'package:step_tracker_app/presentation/widgets/inputs/custom_text_form_field.dart';

part 'widgets/password_field.dart';
part 'widgets/register_elevated_button.dart';

class RegisterScreen extends StatelessWidget with RegisterScreenMixin<RegisterScreen> {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(authService: Injector.authService, screenContext: context, sendMailService: Injector.sendMailService),
      child: _listener(context),
    );
  }

  BlocListener<RegisterCubit, RegisterState> _listener(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) {
        if (current.isLoading) {
          LoadingAlertDialog.showLoading(context);
        }
        if (previous.isLoading && (current.errorOccur || current.emptyFields)) {
          Navigator.of(context).pop();
          clearControllers();
        }
        return true;
      },
      listener: (context, state) {
        if (state.emailSended) {
          Navigator.of(context).pop();
          clearControllers();
          Fluttertoast.showToast(msg: LocaleKeys.toast_messages_mail_send.tr());
          context.push(
            '/${AppRouters.vertificationPath}',
            extra: VertificationIncomingDataModel(registerDataModel: context.read<RegisterCubit>().registerDataModel, isComingFromRegister: true),
          );
        }
        if (state.emptyFields) {
          Fluttertoast.showToast(msg: LocaleKeys.toast_messages_empty_fields.tr());
        }
      },
      child: _Body(usernameController: usernameController, emailController: emailController, passwordController: passwordController),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      appBar: CustomAppbar(title: LocaleKeys.register_title.tr(), centerTitle: true, leading: const CustomBackButton()),
      body: SingleChildScrollView(
        child: Padding(
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
                PasswordField(passwordController: passwordController),
                context.emptyBoxLargeVertical,
                RegisterElevatedButton(
                  usernameController: usernameController,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                context.emptyBoxLargeVertical,
                DoubleTextActionButton(
                  text: LocaleKeys.register_already_have_an_account.tr(),
                  callbackAction: () => context.pop(),
                  secondText: LocaleKeys.register_login.tr(),
                  secondTextColor: context.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
