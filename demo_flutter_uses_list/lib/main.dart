import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
    );
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
              onTap: () => Get.to(IceFlower()),
            ),
            ListTile(
              leading: Icon(Icons.tab),
              title: Text('File Picture'),
              onTap: () => Get.to(FilePicture(
                items: List<String>.generate(10000, (i) => 'Picture $i'),//tạo list items từ 1 đến 10000
              )),
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
              FlatButton(
                onPressed: () => Get.to(MyHomePage()),
                child: Text('Goto Home'),
                color: Colors.green,
              ),
            ],
          ),
        ));
  }
}

class FilePicture extends GetWidget {
  final List<String> items;

  FilePicture({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long list';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child:
      ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(//show snackbar khi click vào 1 items
              SnackBar(
                  content: Text('Snackbar Picture $index'),
              action: SnackBarAction(
              label: 'Action',
              onPressed: () {
              // Code to execute.
              },
              ),));
            },
          );
        },
      ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(MyHomePage());
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
