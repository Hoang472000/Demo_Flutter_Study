import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  final scanffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scanffoldKey,
      appBar: AppBar(
        title: Text('Demo GlobalKey',style: TextStyle(color: Colors.redAccent)),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Show snackBar',style: TextStyle(color: Colors.redAccent),),
          color: Colors.blue,
          onPressed: (){
            final snackBar = SnackBar(content: Text('khong the truy cap vi ly do hay ma khong vote'));
            scanffoldKey.currentState.showSnackBar(snackBar);
          },
        ),
      ),
    );
  }

}