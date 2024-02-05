import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'env/.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'LOG_BASE_URL')
  static final String logBaseUrl = _Env.logBaseUrl;

  @EnviedField(varName: 'SMTP_PASSWORD')
  static final String smtpPassword = _Env.smtpPassword;

  @EnviedField(varName: 'SMTP_HOST')
  static final String smtpHost = _Env.smtpHost;
}
