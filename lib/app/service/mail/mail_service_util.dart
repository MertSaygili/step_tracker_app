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
    message.subject = LocaleKeys.email.tr();
    message.html = _MailHtml.htmlPartOne + vertificationCode + _MailHtml.htmlPartTwo;

    return message;
  }
}

@immutable
final class _MailHtml {
  const _MailHtml._();
  static String htmlPartOne =
      '''<body style="width: 100% !important; -webkit-text-size-adjust: none; margin: 0; padding: 0;"> <center> <table id="backgroundTable" style="border-spacing: 0; border-collapse: collapse; font-family: proxima-nova, 'helvetica neue', helvetica, arial, geneva, sans-serif; width: 100% !important; height: 100% !important; color: #4c4c4c; font-size: 15px; line-height: 150%; background: #ffffff; margin: 0; padding: 0; border: 0;"> <tr style="vertical-align: top; padding: 0;"> <td align="center" valign="top" style="vertical-align: top; padding: 0;"> <table id="templateContainer" style="border-spacing: 0; border-collapse: collapse; font-family: proxima-nova, 'helvetica neue', helvetica, arial, geneva, sans-serif; width: 600px; color: #4c4c4c; font-size: 15px; line-height: 150%; background: #ffffff; margin: 40px 0; padding: 0; border: 0;"> <tr style="vertical-align: top; padding: 0;"> <td class="templateContainerPadding" align="center" valign="top" style="vertical-align: top; padding: 0 40px;"> <table id="templateContent" style="border-spacing: 0; border-collapse: collapse; font-family: proxima-nova, 'helvetica neue', helvetica, arial, geneva, sans-serif; width: 100%; background: #ffffff; margin: 0; padding: 0; border: 0;"> <tr style="vertical-align: top; padding: 0;"> <td style="vertical-align: top; text-align: left; padding: 0;" align="left" valign="top"> <h1 id="logo" style="color: #4E73DF; display: block; font-family: hybrea, proxima-nova, 'helvetica neue', helvetica, arial, geneva, sans-serif; font-size: 32px; font-weight: 200; text-align: left; margin: 0 0 40px;" align="left"> <p style="margin: 20px 0;">${LocaleKeys.email_reset_password_body.tr()}:</p> <p style="margin: 20px 0;text-align: center;font-size: 35px;font-weight: bold;color:#4E73DF">''';
  static String htmlPartTwo =
      '''</p> <p style="margin: 20px 0;">${LocaleKeys.email_warning_email.tr()}</p> <p style="margin: 20px 0;"><a href="" style="color: #6E5BAA;"></a> </p> </td> </tr> </table> </td> </tr> <tr style="vertical-align: top; padding: 0;"> <td class="templateContainerPadding" align="center" valign="top" style="vertical-align: top; padding: 0 40px;"> <table id="footerContent" style="border-spacing: 0; border-collapse: collapse; font-family: proxima-nova, 'helvetica neue', helvetica, arial, geneva, sans-serif; width: 100%; border-top-style: solid; border-top-color: #ebeaef; color: #999999; font-size: 12px; background: #ffffff; margin: 0; padding: 0; border-width: 1px 0 0;"> <tr style="vertical-align: top; padding: 0;"> <td valign="top" style="vertical-align: top; text-align: left; padding: 0;" align="left"> <p style="margin: 20px 0;">${LocaleKeys.email_footer.tr()}</p></td></tr> </table> </td> </tr> </table> </td> </tr> </table> </center> <style type="text/css"> body { width: 100% !important; } .ReadMsgBody { width: 100%; } .ExternalClass { width: 100%; } body { -webkit-text-size-adjust: none; } body { margin: 0; padding: 0; } img { border: 0; outline: none; text-decoration: none; } #backgroundTable { height: 100% !important; margin: 0; padding: 0; width: 100% !important; } #backgroundTable { color: #4c4c4c; background-color: #ffffff; font-family: proxima-nova, 'helvetica neue', helvetica, arial, geneva, sans-serif; font-size: 15px; line-height: 150%; } @media (max-width: 540px) { #templateContainer { width: 100% !important; } #templateContainer .templateContainerPadding { padding: 0 5% !important; } } </style> </body>''';
}
