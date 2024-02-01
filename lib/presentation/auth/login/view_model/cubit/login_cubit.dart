import 'package:flutter/material.dart';
import 'package:step_tracker_app/app/bloc/base_cubit.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service.dart';
import 'package:step_tracker_app/presentation/auth/login/view_model/states/login_states.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit({required this.authService, required this.screenContext}) : super(const LoginState());
  final AuthService authService;
  final BuildContext screenContext;

  void _changeLoading(bool loading) {
    emit(state.copyWith(isLoading: loading));
  }

  void changeObsecure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }

  Future<void> signIn(String email, String password) async {
    _changeLoading(true);

    final response = await authService.signIn(email: email, password: password);

    if (response == true) {
      emit(state.copyWith(isLoading: false, loginSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, errorOccur: true));
    }
  }

  Future<void> googleSignIn() async {
    await authService.googleSignIn().then((value) {
      emit(state.copyWith(isLoading: false, loginSuccess: true, errorOccur: false));
    }).catchError((e) {
      emit(state.copyWith(isLoading: false, errorOccur: true, loginSuccess: false));
    });
  }
}
