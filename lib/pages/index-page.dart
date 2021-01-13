import 'package:flutter/material.dart';
import 'package:flutter_dev_app/utils/app.dart';

void main() {
  runApp(IndexPage());
}

class IndexPage extends StatefulWidget { // 动态、有状态
  // IndexPage(){
  // };
  // static 在类本身上可用，而不是在类的实例上 静态方法
  // final 不可变，包含集合的final字段，则该集合仍然可变
  // const 编译时计算的数据创建它们 1 + 2 是一个合法的const表达式，但new DateTime.now（）不是，递归的const

  final String title = 'Tabs Page';

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  String _token = '';
  int _counter = 0; // _下划线开头，私有state

  @override
  void initState() {
    super.initState();
    App.storage.getData<String>('token').then((value) {
      setState(() {
        _token = value;
      });
    });
    
  }

  void _incrementCounter() {
    // 调用setState更新状态
    setState(() {
      _counter++;
    });

    App.http.get('http://192.168.0.102:3000/api/test').then((res) {
      print('$res');
    });
  }

  @override
  Widget build(BuildContext context) {
    // 每次调用setState时都会重新运行此方法
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column( // Column可以在垂直方向排列其子组件
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("IndexPage navigateTo page"),
              onPressed: () {
                App.router.navigateTo(context, "/");
              },
            ),
            Text('$_counter'),
            Text('token is: $_token'),
            RaisedButton(
              child: Text("IndexPage pop page"),
              onPressed: () {
                App.router.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
