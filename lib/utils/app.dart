import 'package:flutter_dev_app/utils/routes.dart';
import 'package:flutter_dev_app/utils/storage.dart';
import 'package:flutter_dev_app/utils/net_utils.dart';

enum ENV {
  PRODUCTION,
  DEV,
}

class App {
  static ENV env = ENV.DEV;
  static Routes router;
  static Storage storage;
  static HttpUtil http;
}