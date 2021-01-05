import 'package:flutter/material.dart';
import 'package:flutter_dev_app/utils/app.dart';
import 'package:flutter_dev_app/utils/routes.dart';
import 'package:flutter_dev_app/utils/storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}): super(key: key) {
    App.router = Routes();
    App.storage = Storage();
  }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      title: 'Fluro Dev App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: App.router.generator,
    );
    // App.router.matchRoute(context, '/');
    return app;
  }
}