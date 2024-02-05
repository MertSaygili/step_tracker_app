// ignore_for_file: cascade_invocations

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:mailer/mailer.dart';
import 'package:step_tracker_app/app/env/env.dart';
import 'package:step_tracker_app/app/localization/locale_keys.g.dart';

@immutable
final class MailServiceUtil {
  static Message createPinCodeMail(String userMail, String vertificationCode) {
    final mailAddress = Env.smtpHost;

    final message = Message();
    message.from = Address(mailAddress);
    message.recipients.add(userMail);
    message.subject = LocaleKeys.email_reset_password.tr();
    message.html = _MailHtml.getMail(vertificationCode);

    return message;
  }
}

@immutable
final class _MailHtml {
  const _MailHtml._();

  static String getMail(String vertificationCode) {
    final mail = '''
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${LocaleKeys.email_reset_password.tr()}</title>
      </head>
      <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; text-align: center; padding: 20px;">
        <h1 style="color: #007BFF; align: left;">${LocaleKeys.email_reset_password.tr()}</h1>
        <p>
          ${LocaleKeys.email_reset_password_body.tr()}
        </p>
        <h2 style="color: #28a745;">$vertificationCode</h2>
        <p>
        ${LocaleKeys.email_warning_email.tr()}
        </p>
        <hr>
        <p style ="color: #808080">
          ${LocaleKeys.email_footer.tr()}
        </p>
      </body>
      </html>
    ''';
    return mail;
  }
}
