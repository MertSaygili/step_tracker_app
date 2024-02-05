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
          callbackAction: () async {
            // sends mail to user
            await context.read<RegisterCubit>().sendEmail(
                  RegisterDataModel(
                    username: usernameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
          },
          text: LocaleKeys.register_create_account.tr(),
          textColor: context.whiteColor,
        );
      },
    );
  }
}
