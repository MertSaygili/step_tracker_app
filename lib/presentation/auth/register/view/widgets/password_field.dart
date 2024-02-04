part of '../register_screen.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({required this.passwordController, super.key});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomTextFormField(
          isObscure: !state.obsecure,
          textController: passwordController,
          inputType: TextInputType.visiblePassword,
          inputAction: TextInputAction.next,
          labelText: LocaleKeys.register_password.tr(),
          suffix: IconButton(
            icon: !state.obsecure ? const Icon(AppIcons.visibility) : const Icon(AppIcons.visibilityOff),
            onPressed: () => context.read<RegisterCubit>().changeObs(),
          ),
        );
      },
    );
  }
}
