import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.obsecure = false,
    this.isLoading = false,
    this.errorOccur = false,
    this.emailSended = false,
    this.sendEmailError = false,
    this.emptyFields = false,
  });

  final bool obsecure;
  final bool isLoading;
  final bool errorOccur;
  final bool emailSended;
  final bool sendEmailError;
  final bool emptyFields;

  RegisterState copyWith({bool? obsecure, bool? isLoading, bool? emailSended, bool? errorOccur, bool? sendEmailError, bool? emptyFields}) {
    return RegisterState(
      obsecure: obsecure ?? false,
      isLoading: isLoading ?? false,
      errorOccur: errorOccur ?? false,
      emailSended: emailSended ?? false,
      sendEmailError: sendEmailError ?? false,
      emptyFields: emptyFields ?? false,
    );
  }

  @override
  List<Object> get props => [
        obsecure,
        isLoading,
        errorOccur,
        emailSended,
        sendEmailError,
        emptyFields,
      ];
}
