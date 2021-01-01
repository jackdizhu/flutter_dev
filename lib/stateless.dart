import 'package:flutter/material.dart';

void main() {
  runApp(Stateless());
}

class Stateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless"),
      ),
      body: Center(
        child: Text("This is Stateless"),
      ),
    );
  }
}
