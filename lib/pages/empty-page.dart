import 'package:flutter/material.dart';
import 'package:flutter_dev_app/utils/app.dart';

void main() {
  runApp(EmptyPage());
}

class EmptyPage extends StatelessWidget {
  EmptyPage() {
    App.storage.saveData('token', '');
  }

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
