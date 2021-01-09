import 'package:flutter/material.dart';

import 'package:flutter_dev_app/model/widget.dart';
import './Align/index.dart' as Align;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Align',
    routerName: Align.Demo.routeName,
    buildRouter: (BuildContext context) => Align.Demo(),
  ),
];
