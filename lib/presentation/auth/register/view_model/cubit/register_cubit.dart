import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:step_tracker_app/app/bloc/base_cubit.dart';
import 'package:step_tracker_app/app/database/shared_manager.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service.dart';
import 'package:step_tracker_app/app/service/mail/send_mail_service.dart';
import 'package:step_tracker_app/app/util/mail_service_util.dart';
import 'package:step_tracker_app/app/util/otp_creator.dart';
import 'package:step_tracker_app/presentation/auth/register/model/register_data_model.dart';
import 'package:step_tracker_app/presentation/auth/register/view_model/states/register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit({required this.authService, required this.screenContext, required this.sendMailService}) : super(const RegisterState());

  final AuthService authService;
  final SendMailService sendMailService;
  final BuildContext screenContext;

  late RegisterDataModel _registerDataModel;

  void changeObs() {
    emit(state.copyWith(obsecure: !state.obsecure));
  }

  Future<void> sendEmail(RegisterDataModel registerData) async {
    _changeLoading(true);
    _registerDataModel = registerData;
    print('SAAAAA');
    print(_registerDataModel);

    // save pin code to local db
    final pinCode = OTPCreator.createOTP();
    await SharedManager.saveString(SharedEnums.pinCode, pinCode);
    log(pinCode);

    final message = MailServiceUtil.createPinCodeMail(registerData.email, pinCode);
    final response = await sendMailService.sendMail(message);

    if (response == true) {
      emit(state.copyWith(isLoading: false, emailSended: true));
    } else {
      emit(state.copyWith(isLoading: false, sendEmailError: true));
    }
  }

  // Future<void> register(String username, String email, String password) async {
  //   _changeLoading(true);

  //   final response = await authService.signUp(name: username, email: email, password: password);

  //   if (response == true) {
  //     emit(state.copyWith(isLoading: false, isRegisterSuccess: true));
  //   } else {
  //     emit(state.copyWith(isLoading: false, errorOccur: true));
  //   }
  // }

  RegisterDataModel get registerDataModel => _registerDataModel;

  void _changeLoading(bool loading) {
    emit(state.copyWith(isLoading: loading));
  }
}
