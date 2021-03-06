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
  var listTile=<Widget>[// tao uniquekey se sinh ra cac key ko trung nhau
    Padding(
        key: ValueKey(113),//su dung valuekey thi no se ko thay doi ,con globalkey se sinh ra key ngau nhien ko trung nhau
        padding: const EdgeInsets.all(8.0),
        child: Tile(key: ValueKey(113),)
    ),
    Padding(
        // key: GlobalKey(),//khai bao global cho key nam o padding (de danh key cho padding )
        padding: const EdgeInsets.all(8.0),
        child: Tile()//ko khai bao local cho key nam ow tile (se lam cho element ko nhan ddc padding co key la gi)
    ),
  ];

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

class Tile extends StatefulWidget {//khi chuyen tu less sang ful thi no ko doi mau
  // NN: do khi thuc hien wrap thi element no ko phan biet duoc widget nao dan den ko color ko doi
  // BPXL: them key cho widget no se them key cho element ,va wrap thi element no se tim den dung key
  Tile({Key key}):super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
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
  // M??u s???c ???????c t???o n??n t??? RGB, l?? m???t s??? ng???u nhi??n t??? 0 -> 255 v?? opacity = 1
  return Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
}


/*
Gi???i th??ch h??m swap 2 ph???n t??? trong List:
(*): Logic h??m *swap* ch??? n??y c?? th??? g??y kh?? hi???u. Gi??? s??? ta c?? m???t `list` c?? 2 ph???n t??? l???n l?????t theo th??? t???
c?? t??n l?? `A` v?? `B`: `[A, B]`, ????? swap 2 ph???n t??? trong m???t list ta c???n ?????n 2 h??m l?? `removeAt` v?? `insert`.
?????u ti??n `list` th???c hi???n remove ph???n t??? index l?? 0, t???c l?? remove `A` ra kh???i `list`.
H??m `removeAt` n??y l???i tr??? v??? ch??nh ph???n t??? b??? lo???i b??? ???? lu??n ch??nh l?? tr??? v??? `A`.
Sau khi remove, l??c n??y `list` ch??? c??n 1 ph???n t??? duy nh???t l?? `B` t???i index l?? 0.
Ta ti???p t???c g???i h??m `insert`, ????? ch??n ph???n t??? v???a b??? lo???i l?? `A` v??o v??? tr?? index l?? 1.
Nh?? v???y sau khi `insert`, `list` l???i c?? 2 ph???n t??? l?? `[B, A]` (???? swap th??nh c??ng t??? list ban ?????u l?? `[A, B]`).

var list = ['A', 'B'];
var a = list.removeAt(0);
list.insert(1, a);
print(list); // [B, A]
*/



