import 'package:flutter/material.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatelessWidget { // 静态、无状态
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // theme 主题
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget { // 动态、有状态
  MyHomePage({Key key, this.title}) : super(key: key);
  // static 在类本身上可用，而不是在类的实例上 静态方法
  // final 不可变，包含集合的final字段，则该集合仍然可变
  // const 编译时计算的数据创建它们 1 + 2 是一个合法的const表达式，但new DateTime.now（）不是，递归的const

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // _下划线开头，私有state

  void _incrementCounter() {
    // 调用setState更新状态
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 每次调用setState时都会重新运行此方法
    return Scaffold(
      appBar: AppBar(
        // set our appbar title.
        title: Text(widget.title),
      ),
      body: Center( // Center is a layout widget
        // in the middle of the parent.
        child: Column( // Column可以在垂直方向排列其子组件
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Demo:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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
