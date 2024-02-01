import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState();

  RegisterState copyWith({bool? isLoading, bool? loginSuccess, bool? isObscure, bool? errorOccur}) {
    return const RegisterState();
  }

  @override
  List<Object> get props => [];
}
