// ignore_for_file: use_string_buffers

import 'dart:math';

final class OTPCreator {
  static String createOTP({int length = 6}) {
    var result = '';
    for (var i = 0; i < length; i++) {
      result += Random().nextInt(10).toString();
    }
    return result;
  }
}
