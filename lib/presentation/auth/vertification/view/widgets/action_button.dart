part of '../vertification_screen.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({required this.vertificationIncomingDataModel, super.key});

  final VertificationIncomingDataModel vertificationIncomingDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VertificationCubit, VertificationStates>(
      builder: (context, state) {
        return CustomLongElevatedButton(
          text: vertificationIncomingDataModel.isComingFromRegister ? LocaleKeys.register_create_account.tr() : LocaleKeys.reset_password_title.tr(),
          callbackAction: () async {
            if (vertificationIncomingDataModel.isComingFromRegister) {
              await context.read<VertificationCubit>().register();
            } else {
              await context.read<VertificationCubit>().forgotPassword();
            }
          },
          textColor: context.whiteColor,
        );
      },
    );
  }
}
