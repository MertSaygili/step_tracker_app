part of '../vertification_screen.dart';

class ResendPincodeButton extends StatelessWidget {
  const ResendPincodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VertificationCubit, VertificationStates>(
      builder: (context, state) {
        return CustomTextButton(
          text: LocaleKeys.vertification_resend.tr(),
          callbackAction: () async {
            await context.read<VertificationCubit>().sendMailAgain();
          },
          textColor: context.primaryColor,
        );
      },
    );
  }
}
