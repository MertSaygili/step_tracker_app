import 'package:easy_localization/easy_localization.dart';
import 'package:step_tracker_app/app/bloc/base_cubit.dart';
import 'package:step_tracker_app/app/database/shared_manager.dart';
import 'package:step_tracker_app/app/localization/locale_keys.g.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service.dart';
import 'package:step_tracker_app/app/service/mail/send_mail_service.dart';
import 'package:step_tracker_app/app/util/mail_service_util.dart';
import 'package:step_tracker_app/app/util/otp_creator.dart';
import 'package:step_tracker_app/presentation/auth/vertification/model/vertification_incoming_data_model.dart';
import 'package:step_tracker_app/presentation/auth/vertification/view_model/states/vertification_states.dart';

class VertificationCubit extends BaseCubit<VertificationStates> {
  VertificationCubit({
    required this.authService,
    required this.vertificationIncomingDataModel,
    required this.sendMailService,
  }) : super(const VertificationStates());

  final AuthService authService;
  final SendMailService sendMailService;
  final VertificationIncomingDataModel vertificationIncomingDataModel;

  String _userInput = '';
  double _sendMailCount = 0;

  Future<void> sendMailAgain() async {
    if (_sendMailCount == 3) {
      emit(state.copyWith(isLoading: false, errorOccur: true, errorText: LocaleKeys.toast_messages_send_mail_repeat_error.tr()));
      return;
    }
    emit(state.copyWith(isLoading: true));
    if (vertificationIncomingDataModel.registerDataModel == null) return;

    // create new pin code, save to local db
    final pinCode = OTPCreator.createOTP();
    await SharedManager.saveString(SharedEnums.pinCode, pinCode);

    final message = MailServiceUtil.createPinCodeMail(vertificationIncomingDataModel.registerDataModel!.email, pinCode);
    final response = await sendMailService.sendMail(message);

    if (response == true) {
      emit(state.copyWith(isLoading: false, emailSended: true));
      _sendMailCount++;
    } else {
      emit(state.copyWith(isLoading: false, errorOccur: true, errorText: LocaleKeys.toast_messages_mail_send_error.tr()));
    }
  }

  Future<void> register() async {}

  Future<void> forgotPassword() async {}

  void setUserInput(String val) {
    _userInput = val;
  }
}
