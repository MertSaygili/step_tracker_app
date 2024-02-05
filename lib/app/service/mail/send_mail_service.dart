import 'dart:developer';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:step_tracker_app/app/env/env.dart';

@override
Future<bool> sendMail(Message vertificationMessage) async {
  final smtpServer = gmail(Env.smtpHost, Env.smtpPassword);
  final message = vertificationMessage;

  try {
    final sendReport = await send(message, smtpServer);
    log('Message sent: $sendReport');
    return true;
  } catch (e) {
    return false;
  }
}
