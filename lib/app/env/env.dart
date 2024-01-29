import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'env/.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'LOG_BASE_URL')
  static final String logBaseUrl = _Env.logBaseUrl;
}
