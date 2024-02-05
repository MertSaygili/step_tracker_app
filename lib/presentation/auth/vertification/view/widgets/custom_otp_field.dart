// ignore_for_file: avoid_redundant_argument_values, avoid_dynamic_calls, unnecessary_lambdas

part of '../vertification_screen.dart';

class CustomOTPField extends StatelessWidget {
  const CustomOTPField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VertificationCubit, VertificationStates>(
      builder: (context, state) {
        return OtpTextField(
          numberOfFields: 6,
          borderColor: context.primaryColor.withOpacity(0.3),
          showFieldAsBox: true,
          onCodeChanged: (String code) => context.read<VertificationCubit>().setUserInput(code),
          keyboardType: TextInputType.number,
          cursorColor: context.primaryColor,
          enabledBorderColor: context.borderColor,
          focusedBorderColor: context.primaryColor,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onSubmit: (String verificationCode) => context.read<VertificationCubit>().setUserInput(verificationCode),
        );
      },
    );
  }
}
