part of '../login_screen.dart';

class _SignInButton extends StatelessWidget {
  const _SignInButton({required this.emailController, required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomLongElevatedButton(
          callbackAction: () async {
            await context.read<LoginCubit>().signIn(emailController.text, passwordController.text);
          },
          text: LocaleKeys.login_title.tr(),
          textColor: context.whiteColor,
        );
      },
    );
  }
}
