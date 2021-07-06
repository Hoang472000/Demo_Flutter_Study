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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller c= Get.put(Controller());//khởi tạo controller
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Navigator'),
      ),
      body: Center(
        child: Text('My Page'),
      ),
      drawer: Drawer(//vẽ ngăn xếp
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(// gồm phần header
              decoration: BoxDecoration(
                color:Colors.green,
              ),
              child: Text('Drawer Head'),

            ),
            ListTile(//phần thân
              title: Text('item1'),
              onTap: (){
                c.updatetitle('item1');//update title trong controller
                Navigator.pop(context);// lệnh đóng ngăn xếp
                Get.to(PageItem());//đi đến trang khác

              },
            ),
            ListTile(//phần thân
              title: Text('item2'),
              onTap: (){
                c.updatetitle('item2');
                Navigator.pop(context);
                Get.to(PageItem());
              },
            )
          ],
        ),
      ),
    );
  }
}

class Controller extends GetxController{
  var title = '';
  void updatetitle(title1){
    title=title1;
    update();
  }
}

class PageItem extends StatelessWidget {
  final Controller c = Get.find();//tìm đến controller sử dụng gần đấy
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page ${c.title}'),//lấy ra title trong controller
      ),
      body: Center(
        child: Text('This is Page ${c.title}'),
      ),
    );
  }
}
