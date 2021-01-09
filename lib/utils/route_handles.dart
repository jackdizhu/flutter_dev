import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dev_app/demo/widget_demo.dart';
import 'package:flutter_dev_app/pages/tabs-page.dart';
import 'package:flutter_dev_app/pages/form-page.dart';
import 'package:flutter_dev_app/pages/empty-page.dart';
// import 'package:flutter_dev_app/pages/bar-page.dart';

import 'package:flutter_dev_app/widgets/index.dart';

List getDemoList() {
  return new WidgetDemoList().getDemos();
}
List getRouterName() {
  List demoList = getDemoList();
  List<dynamic> demoListRouterName = [];
  demoList.forEach((item) {
    demoListRouterName.add({
      'name': item.name,
      'cnName': item.cnName,
      'routerName': item.routerName?.toLowerCase()
    });
  });
  return demoListRouterName;
}

// 空页面
var emptyHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return EmptyPage();
  });

// // 空页面
// var barHandler = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     return BarPage();
//   });
    
// 首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return TabsPage();
  });

var formHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return FormPage();
  });