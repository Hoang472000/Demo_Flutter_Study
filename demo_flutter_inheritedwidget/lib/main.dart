import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(child: MyCenterWidget(),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.child});
  final Widget child;
  @override
  State<StatefulWidget> createState() {
     return MyHomePageState();
  }

}

class MyHomePageState extends State<MyHomePage> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    print('1.ham build duoc rebuild ');
    return Scaffold(
      appBar: AppBar(title: Text('Demo InheritedWidget'),),
      body:MyInheritedWidget(//dat o vi tri cha cua widget ma minh muon truyen data vao
        //child: MyCenterWidget(),
        child: widget.child,
        myData: counter,//truyen data vao myData
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('2.myCenterWidget');
    return Center(
      child: MyText(),
    );

  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter= MyInheritedWidget.of1(context).myData;// lay du lieu tu MyInheritedWidget
    print('3.myText $counter');
    return Text('tui la widget Text. Data hien tai cua tui la : $counter');
  }
}

class MyInheritedWidget extends InheritedWidget{
  MyInheritedWidget({Widget child, this.myData}):super(child: child);//ham nay co 2 tham so la widget con va data se chia se cho cac widget con
  final int myData;//phai khai bao final
  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return myData!=oldWidget.myData;// neu myData thay doi se return true de rebuild lai cac widget phu thuoc MyInheritedWidget
  }

  static MyInheritedWidget of(BuildContext context){//ham nay de truy cap vao class MyInheritedWidget
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
  static MyInheritedWidget of1(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

}
