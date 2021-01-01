import 'package:flutter/material.dart';
import '../utils/App.dart';

void main() {
  runApp(FormPage());
}

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FormPage"),
      ),
      body: Center(
        child: Column( // Column可以在垂直方向排列其子组件
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("FormPage navigateTo page"),
              onPressed: () {
                App.router.navigateTo(context, "/");
              },
            ),
            RaisedButton(
              child: Text("FormPage pop page"),
              onPressed: () {
                App.router.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
