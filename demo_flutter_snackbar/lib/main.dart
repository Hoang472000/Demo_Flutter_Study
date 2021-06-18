import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(//tao 1 style chung va share style nay den cac Widget khap Widget tree
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Demo SnackBar'),),//tao AppBar
      body: Center(
        child:Builder(//ham Builder tao ra context moi
          builder: (context)=>buildFlatButton(context),// tu vi tri context nay se tim thay scaffold ben tren
        )
      ),
    );
  }

  FlatButton buildFlatButton(BuildContext context) {//chi thuc hien truyen context khong tao ra context moi
    return FlatButton(
        child: Text('Show Snack bar'),
        color: Colors.green,
        onPressed: (){
          final snackBar = SnackBar(content: Text('khong the truy cap bai viet nay vi thay hay ma khong vote'));
          Scaffold.of(context).showSnackBar(snackBar);//o day no yeu cau truyen vao 1 context
                                                      //ma context no se lay tu ham MyHomePage ,no se kiem tra xem truoc do co thang scaffold nao khong
        },
      );
  }
}