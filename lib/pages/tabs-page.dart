import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dev_app/utils/store/counterModel.dart';
import 'package:flutter_dev_app/components/counter.dart';
import 'package:flutter_dev_app/utils/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: TabsPage(),
    ),
  );
}


class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);
  _setToken () {
    App.storage.saveData('token', '--token--');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabsPage"),
      ),
      body: Center(
        child: Column( // Column可以在垂直方向排列其子组件
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CounterText(),
            RaisedButton(
              child: Text("form-page"),
              onPressed: () {
                App.router.navigateTo(context, "/form-page");
              },
            ),
            RaisedButton(
              child: Text("empty-page"),
              onPressed: () {
                App.router.navigateTo(context, "/empty-page");
              },
            ),
            RaisedButton(
              child: Text("setToken"),
              onPressed: () {
                _setToken();
              },
            ),
          ],
        ),
      ),
    );
  }
}
