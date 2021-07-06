import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: MyDemo());//MyDemo1
  }
}

class MyDemo extends StatelessWidget{
  final List<Tab> myTabs = <Tab>[
    Tab(text:'LEFT'),
    Tab(text: 'MIDDLE'),
    Tab(text: 'RIGHT'),
  ];

  @override
  Widget build(BuildContext context) {//DefaultTabController(length: số lượng tab, child: phần nội dung hiển thị)
    return DefaultTabController(length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(//tạo tabbar ở phía dưới của thanh AppBar
              tabs: myTabs,
            ),
            title: Text('Demo DefaultTabController'),
          ),
          body: TabBarView(
            children: myTabs.map((Tab tab){
              final String lable= tab.text.toLowerCase();
              return Center(
                child: Text(
                  'this is the tab',
                  style: const TextStyle(fontSize: 36),
    ),
    );

    }).toList(),
        )));
  }
}

class MyDemo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.add),),
                Tab(icon: Icon(Icons.ios_share),),
                Tab(icon: Icon(Icons.delete),)
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.add),
              Icon(Icons.ios_share),
              Icon(Icons.delete),
            ],
          ),

        ));
  }

}
