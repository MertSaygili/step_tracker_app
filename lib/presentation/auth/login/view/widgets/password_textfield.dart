part of '../login_screen.dart';

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextFormField(
          textController: passwordController,
          inputType: TextInputType.visiblePassword,
          isObscure: !state.isObscure,
          inputAction: TextInputAction.done,
          labelText: LocaleKeys.login_password.tr(),
          suffix: IconButton(
            icon: Icon(!state.isObscure ? AppIcons.visibility : AppIcons.visibilityOff),
            onPressed: () {
              context.read<LoginCubit>().changeObsecure();
            },
          ),
        );
      },
    );
  }
}
