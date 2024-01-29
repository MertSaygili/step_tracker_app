import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isLoading = false,
    this.loginSuccess = false,
  });

  final bool isLoading;
  final bool loginSuccess;

  LoginState copyWith({bool? isLoading, bool? loginSuccess}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      loginSuccess: loginSuccess ?? this.loginSuccess,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        loginSuccess,
      ];
}
