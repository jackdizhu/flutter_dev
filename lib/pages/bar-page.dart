import 'package:flutter/material.dart';
// import 'package:flutter_dev_app/widgets/components/Bar/index.dart';



void main() {
  runApp(BarPage());
}

class BarPage extends StatelessWidget {
  BarPage() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BarPage"),
      ),
      body: Text("BarPage"),
    );
  }
}
