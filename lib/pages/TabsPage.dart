import 'package:flutter/material.dart';
import '../utils/App.dart';

void main() {
  runApp(TabsPage());
}

class TabsPage extends StatelessWidget {

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
          ],
        ),
      ),
    );
  }
}
