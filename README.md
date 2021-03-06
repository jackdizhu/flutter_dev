# flutter_dev_app

A new Flutter project

## Provider

1. 容易造成不必要的刷新
2. 不支持跨页面(route)的状态，意思是跨树，如果不在一个树中，我们无法获取
3. 数据是不可变的，必须结合StatefulWidget、ChangeNotifier或者Steam使用

```dart
// 父级组件
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
```
```dart
// 子级组件
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
```