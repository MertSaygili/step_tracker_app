import 'package:equatable/equatable.dart';

class VertificationStates extends Equatable {
  const VertificationStates({this.errorOccur = false, this.emailSended = false, this.isLoading = false, this.errorText = ''});

  final bool isLoading;
  final bool emailSended;
  final bool errorOccur;
  final String errorText;

  VertificationStates copyWith({bool? isLoading, bool? emailSended, bool? errorOccur, String? errorText}) {
    return VertificationStates(
      isLoading: isLoading ?? this.isLoading,
      emailSended: emailSended ?? this.emailSended,
      errorOccur: errorOccur ?? this.errorOccur,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        emailSended,
        errorOccur,
        errorText,
      ];
}
