import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_app/utils/route_handles.dart';
import 'package:flutter_dev_app/utils/app.dart';

class Routes {
  static FluroRouter fluroRouter = FluroRouter();

  final generator = fluroRouter.generator;

  static String root = "/";
  static String form = "/form-page";
  static String empty = "/empty-page";
  static String bar = "/bar-page";

  goHome (BuildContext context) {
    // fluroRouter.navigateTo(context, root);
    Navigator.pushNamedAndRemoveUntil(context, root, (route) => route == null);
  }

  pop (BuildContext context) {
    Navigator.pop(context);
    // fluroRouter.pop(context);
  }

  navigateTo (BuildContext context, String path) {
    App.storage.getData<String>('token').then((value) {
      print('token: $value');
      // if (value == null || value == '') {
      //   Navigator.pushNamed(context, root);
      //   return;
      // }
      Navigator.pushNamed(context, path);
    });
    // fluroRouter.navigateTo(context, path);
  }

  Routes () {
    fluroRouter.define(root, handler: homeHandler);
    fluroRouter.define(form, handler: formHandler);
    fluroRouter.define(empty, handler: emptyHandler);

    List demoList = getDemoList();
    // fluroRouter.define(bar, handler: barHandler);

    demoList.forEach((item) {
      String path = item.routerName.toLowerCase();
      print('$path');
      fluroRouter.define(
        '$path',
        handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          return item.buildRouter(context);
        })
      );
    });
    fluroRouter.notFoundHandler = emptyHandler; // 空页面
  }
}