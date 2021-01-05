import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dev_app/utils/store/counterModel.dart';

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: Consumer<Counter>(
        builder: (_, counter, __) => (
          Column( // Column可以在垂直方向排列其子组件
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${counter.count}'),
              RaisedButton(
                child: Text("change-counter.count"),
                onPressed: () {
                  counter.increment();
                },
              ),
            ],
          )
        ),
      ),
    );
  }
}