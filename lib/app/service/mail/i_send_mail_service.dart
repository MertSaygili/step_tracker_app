import 'package:mailer/mailer.dart';

abstract class ISendMailService {
  Future<bool> sendMail(Message vertificationMessage);
}
