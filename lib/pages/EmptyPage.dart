import 'package:flutter/material.dart';
import '../utils/App.dart';

void main() {
  runApp(EmptyPage());
}

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EmptyPage"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("EmptyPage goHome page"),
          onPressed: () {
            App.router.goHome(context);
          },
        ),
      ),
    );
  }
}
