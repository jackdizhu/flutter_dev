import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dev_app/utils/store/counterModel.dart';
// import 'package:flutter_dev_app/components/counter.dart';
import 'package:flutter_dev_app/utils/app.dart';
import 'package:flutter_dev_app/utils/route_handles.dart';

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
  List list = [];
  TabsPage({Key key}) : super(key: key) {
    list = getRouterName();
  }
  _setToken () {
    App.storage.saveData('token', '--token--');
  }

  @override
  Widget build(BuildContext context) {
    // 可滚动列表， 子 Widget 可以按需构建
    Widget listView = new ListView.builder(
      itemCount: this.list.length,
      itemBuilder: (BuildContext ctxt, int index) {
        Map item = this.list[index];
        String path = item['routerName'];
        String name = item['name'];
        return FlatButton(
          child: Text("${name}"),
          onPressed: () {
            App.router.navigateTo(context, "$path");
          },
        );
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("TabsPage"),
      ),
      body: listView,
    );
  }
}
