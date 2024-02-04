part of '../register_screen.dart';

class RegisterElevatedButton extends StatelessWidget {
  const RegisterElevatedButton({required this.usernameController, required this.emailController, required this.passwordController, super.key});

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomLongElevatedButton(
          callbackAction: () {
            context.read<RegisterCubit>().register(usernameController.text, emailController.text, passwordController.text);
          },
          text: LocaleKeys.register_create_account.tr(),
          textColor: context.whiteColor,
        );
      },
    );
  }
}
