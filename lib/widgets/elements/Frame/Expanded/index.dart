import 'package:flutter/material.dart';

import 'package:flutter_dev_app/model/widget.dart';

import './Expanded/index.dart' as Expanded;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Expanded',
    routerName: Expanded.Demo.routeName,
    buildRouter: (BuildContext context) => Expanded.Demo(),
  ),
];