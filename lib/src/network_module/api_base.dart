import 'package:flutter/foundation.dart';

class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return "prod url here";
    } else {
      return "https://test.com";
    }
  }

  static String get clientSecret {
    if (kReleaseMode) {
      return "Production Client Secret";
    } else {
      return "Dev Client Secret";
    }
  }

  static int get clientId {
    return 2;
  }
}
