import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_app/pages/tabs-page.dart';
import 'package:flutter_dev_app/pages/form-page.dart';
import 'package:flutter_dev_app/pages/empty-page.dart';

// 空页面
var emptyHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return EmptyPage();
  });
    
// 首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return TabsPage();
  });

var formHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    return FormPage();
  });