import 'package:flutter/widgets.dart';
import 'package:step_tracker_app/app/bloc/base_cubit.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service.dart';
import 'package:step_tracker_app/presentation/auth/register/view_model/states/register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit({required this.authService, required this.screenContext}) : super(const RegisterState());

  final AuthService authService;
  final BuildContext screenContext;

  void changeObs() {
    emit(state.copyWith(obsecure: !state.obsecure));
  }

  Future<void> register(String username, String email, String password) async {
    _changeLoading(true);

    final response = await authService.signUp(name: username, email: email, password: password);

    if (response == true) {
      emit(state.copyWith(isLoading: false, isRegisterSuccess: true));
    } else {
      emit(state.copyWith(isLoading: false, errorOccur: true));
    }
  }

  void _changeLoading(bool loading) {
    emit(state.copyWith(isLoading: loading));
  }
}
