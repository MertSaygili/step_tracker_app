import 'package:equatable/equatable.dart';
import 'package:step_tracker_app/presentation/auth/register/model/register_data_model.dart';

class VertificationIncomingDataModel extends Equatable {
  const VertificationIncomingDataModel({required this.isComingFromRegister, this.registerDataModel, this.forgotPasswordEmail});

  final RegisterDataModel? registerDataModel;
  final String? forgotPasswordEmail;
  final bool isComingFromRegister;

  @override
  List<Object?> get props => [
        registerDataModel,
        forgotPasswordEmail,
        isComingFromRegister,
      ];
}
