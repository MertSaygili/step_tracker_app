import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_tracker_app/app/service/firebase/auth/auth_service.dart';
import 'package:step_tracker_app/presentation/login/view_model/states/login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authService}) : super(const LoginState());
  final AuthService authService;

  void _changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> signIn(String email, String password) async {
    print('ss');
    _changeLoading();

    await Future.delayed(const Duration(seconds: 5));

    _changeLoading();
  }

  void googleSignIn() {}
}
