import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var listTile=<Widget>[Tile(),Tile()];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void swapTwoTileWidget(){
    setState(() {
      listTile.insert(1, listTile.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              children: listTile,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _incrementCounter();
          swapTwoTileWidget();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Tile extends StatelessWidget {
  final Color color = generateRandomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}
Color generateRandomColor() {
  final Random random = Random();
  // Màu sắc được tạo nên từ RGB, là một số ngẫu nhiên từ 0 -> 255 và opacity = 1
  return Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
}


/*
Giải thích hàm swap 2 phần tử trong List:
(*): Logic hàm *swap* chỗ này có thể gây khó hiểu. Giả sử ta có một `list` có 2 phần tử lần lượt theo thứ tự
có tên là `A` và `B`: `[A, B]`, Để swap 2 phần tử trong một list ta cần đến 2 hàm là `removeAt` và `insert`.
Đầu tiên `list` thực hiện remove phần tử index là 0, tức là remove `A` ra khỏi `list`.
Hàm `removeAt` này lại trả về chính phần tử bị loại bỏ đó luôn chính là trả về `A`.
Sau khi remove, lúc này `list` chỉ còn 1 phần tử duy nhất là `B` tại index là 0.
Ta tiếp tục gọi hàm `insert`, để chèn phần tử vừa bị loại là `A` vào vị trí index là 1.
Như vậy sau khi `insert`, `list` lại có 2 phần tử là `[B, A]` (đã swap thành công từ list ban đầu là `[A, B]`).

var list = ['A', 'B'];
var a = list.removeAt(0);
list.insert(1, a);
print(list); // [B, A]
*/



