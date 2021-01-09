import 'dart:async' show Future;

import 'package:fluro/fluro.dart';
import './net_utils.dart';
import '../model/user_info.dart';

class DataUtils {
  // 登陆获取用户信息
  static Future apiLogin(Map<String, String> params) async {
    var response = await NetUtils.post('Api.DO_LOGIN', params);
    try {
      UserInformation userInfo = UserInformation.fromJson(response['data']);
      return userInfo;
    } catch (err) {
      return response['message'];
    }
  }
}
