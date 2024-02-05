import 'package:equatable/equatable.dart';

class VertificationStates extends Equatable {
  const VertificationStates({
    this.errorOccur = false,
    this.emailSended = false,
    this.isLoading = false,
    this.errorText = '',
    this.registerSuccess = false,
    this.pushToResetPassword = false,
  });

  final bool isLoading;
  final bool emailSended;
  final bool errorOccur;
  final bool registerSuccess;
  final bool pushToResetPassword;
  final String errorText;

  VertificationStates copyWith({
    bool? isLoading,
    bool? emailSended,
    bool? errorOccur,
    String? errorText,
    bool? registerSuccess,
    bool? pushToResetPassword,
  }) {
    return VertificationStates(
      isLoading: isLoading ?? this.isLoading,
      emailSended: emailSended ?? this.emailSended,
      errorOccur: errorOccur ?? this.errorOccur,
      errorText: errorText ?? this.errorText,
      registerSuccess: registerSuccess ?? this.registerSuccess,
      pushToResetPassword: pushToResetPassword ?? this.pushToResetPassword,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        emailSended,
        errorOccur,
        errorText,
        registerSuccess,
        pushToResetPassword,
      ];
}
