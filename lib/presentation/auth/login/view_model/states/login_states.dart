import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isLoading = false,
    this.loginSuccess = false,
    this.isObscure = false,
    this.errorOccur = false,
  });

  final bool isLoading;
  final bool isObscure;
  final bool loginSuccess;
  final bool errorOccur;

  LoginState copyWith({bool? isLoading, bool? loginSuccess, bool? isObscure, bool? errorOccur}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      isObscure: isObscure ?? this.isObscure,
      errorOccur: errorOccur ?? this.errorOccur,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        loginSuccess,
        isObscure,
        errorOccur,
      ];
}
