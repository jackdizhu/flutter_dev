import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handles.dart';
import './App.dart';

class Routes {
  static FluroRouter fluroRouter = FluroRouter();

  final generator = fluroRouter.generator;

  static String root = "/";
  static String form = "/form-page";
  static String empty = "/empty-page";

  goHome (BuildContext context) {
    // fluroRouter.navigateTo(context, root);
    Navigator.pushNamedAndRemoveUntil(context, root, (route) => route == null);
  }

  pop (BuildContext context) {
    Navigator.pop(context);
    // fluroRouter.pop(context);
  }

  navigateTo (BuildContext context, String path) {
    dynamic token = App.storage.getString('token');
    if (token == '') {
      Navigator.pushNamed(context, root);
      return;
    }
    Navigator.pushNamed(context, path);
    // fluroRouter.navigateTo(context, path);
  }

  Routes () {
    fluroRouter.define(root, handler: homeHandler);
    fluroRouter.define(form, handler: formHandler);
    fluroRouter.define(empty, handler: emptyHandler);
    fluroRouter.notFoundHandler = emptyHandler; // 空页面
  }
}