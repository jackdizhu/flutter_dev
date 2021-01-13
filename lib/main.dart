import 'package:flutter/material.dart';
import 'package:flutter_dev_app/utils/app.dart';
import 'package:flutter_dev_app/utils/routes.dart';
import 'package:flutter_dev_app/utils/storage.dart';
import 'package:flutter_dev_app/utils/net_utils.dart';

void main() {
  App.router = Routes();
  App.storage = Storage();
  App.http = HttpUtil();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}): super(key: key) {
  }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      title: 'Fluro Dev App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        shadowColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: App.router.generator,
    );
    // App.router.matchRoute(context, '/');
    return app;
  }
}