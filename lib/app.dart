import 'package:flutter/material.dart';

import './utils/App.dart';
import './utils/Routes.dart';
import './utils/Storage.dart';

class AppComponent extends StatelessWidget {
  AppComponent({Key key}): super(key: key) {
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