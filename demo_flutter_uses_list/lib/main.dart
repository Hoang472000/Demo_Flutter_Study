import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: MyHomePage(),);
  }
}
class MyHomePage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Flutter Use Lists'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('Flower Ice'),
              onTap: ()=>Get.to(IceFlower()),
            ),
            ListTile(
              leading: Icon(Icons.tab),
              title: Text('File Picture'),
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}

class IceFlower extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IceFlower"),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("This is Ice Flower"),
          FlatButton(onPressed: ()=> Get.to(MyHomePage()), child: Text('Goto Home'),color: Colors.green,)
        ],
      ),
    ));
  }
}


