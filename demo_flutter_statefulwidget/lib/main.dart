import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }

}
//su dung statelessWidget do Text khong thay doi , con counter la gia tri truyen vao va khong bi thay doi trong MyText
class MyText extends StatelessWidget{
    MyText({this.counter});
    final int counter;

  @override
  Widget build(BuildContext context) {
    return Text('tui la widget Text. Data cua tui hien tai la: $counter');
  }
}

class MyHomePageState extends State<MyHomePage> {
  int counter =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyText(counter: counter,),//o day ta truyen vao counter
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {//moi lan setState thi lai goi lai ham build()
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );

  }
}