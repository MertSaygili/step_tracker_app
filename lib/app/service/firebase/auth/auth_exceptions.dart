// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:step_tracker_app/app/localization/locale_keys.g.dart';

@immutable
final class AuthExceptionHandler {
  AuthExceptionHandler.fromException(String code) {
    switch (code) {
      case 'invalid-email':
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_invalid_email.tr();
      case 'wrong-password':
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_wrong_password.tr();
      case 'user-not-found':
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_user_not_found.tr();
      case 'user-disabled':
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_user_disabled.tr();
      case 'too-many-requests':
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_too_many_requests.tr();
      case 'operation-not-allowed':
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_operation_not_allowed.tr();
      case 'email-already-in-use':
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_email_already_in_use.tr();
      case 'user-mismatch':
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_user_mismatch.tr();
      case 'unverified-email':
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_unverified_email.tr();
      case 'null-user':
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_null_user.tr();
      default:
        _custom_message = LocaleKeys.toast_messages_firebase_auth_errors_unkown_error.tr();
    }
  }

  late String _custom_message;
  String get get_message => _custom_message;
}
