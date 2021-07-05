import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Controller extends GetxController{//tạo lớp controller
  var count = 0.obs;// cung cấp khae năng quan sát cho biến count
  increment() => count++;
}

class Home extends StatelessWidget {

  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());// khởi tạo lớp controller

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),// sử dụng Obx để update khi count thay đổi

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(child: ElevatedButton(//sử dụng Get.to(truyền vào 1 giao diện mới (Scaffold))
            child: Text("Go to Other"), onPressed: () => Get.to(Other1()))),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();//tìm đến 1 controller đã được sử dụng ở trang khác

  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(
        body: Center(
          child: Text("${c.count}"),

    ));
  }
}
class Other1 extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();//tìm đến 1 controller đã được sử dụng ở trang khác

  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(
      appBar: AppBar(title: Obx(()=> Text("Click ${c.count}")),),//sd Obx update khi count thay đổi
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("${c.count}"),
              FlatButton(onPressed: ()=>Get.to(Home()), child: Text("Come back Home"),color: Colors.blue,)
            ],
          )

        ));
  }
}