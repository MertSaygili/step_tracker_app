import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.obsecure = false,
    this.isLoading = false,
    this.isRegisterSuccess = false,
    this.errorOccur = false,
  });

  final bool obsecure;
  final bool isLoading;
  final bool isRegisterSuccess;
  final bool errorOccur;

  RegisterState copyWith({bool? obsecure, bool? isLoading, bool? isRegisterSuccess, bool? errorOccur}) {
    return RegisterState(
      obsecure: obsecure ?? false,
      isLoading: isLoading ?? false,
      isRegisterSuccess: isRegisterSuccess ?? false,
      errorOccur: errorOccur ?? false,
    );
  }

  @override
  List<Object> get props => [
        obsecure,
        isLoading,
        isRegisterSuccess,
        errorOccur,
      ];
}
