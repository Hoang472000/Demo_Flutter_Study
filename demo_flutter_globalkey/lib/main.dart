import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

/*
class MyHomePage extends StatelessWidget{
  final scanffoldKey = GlobalKey<ScaffoldState>();// taoj globalKey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scanffoldKey,//cap key cho Scaffold
      appBar: AppBar(
        title: Text('Demo GlobalKey',style: TextStyle(color: Colors.redAccent)),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Show snackBar',style: TextStyle(color: Colors.redAccent),),
          color: Colors.blue,
          onPressed: (){
            final snackBar = SnackBar(content: Text('khong the truy cap vi ly do hay ma khong vote'));
            scanffoldKey.currentState.showSnackBar(snackBar);// dung key de tim Scaffold ,de thuc hien showSnackBar
          },
        ),
      ),
    );
  }

}*/
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State {
  final formStateKey = GlobalKey<FormState>();//Tao GlobalKey
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo TextFormField',style: TextStyle(color: Colors.redAccent),),
      ),
      body: Center(
        child: Form(
          key: formStateKey,//cap key cho form
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Vui long nhap ten',
                    labelText: 'Ten',
                    labelStyle: TextStyle(color: Colors.redAccent)),
                validator: validateTen,
                onSaved: saveTen,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Vui long nhap dung tuoi',
                    labelText: 'Tuoi',
                    labelStyle: TextStyle(color: Colors.redAccent)),
                validator: validateTuoi,
                onSaved: saveTuoi,
              ),
              FlatButton(
                onPressed: (){submitForm();}, //goi submitForm
                child: Text('Submit',style: TextStyle(color: Colors.redAccent),),color: Colors.blue,),
            ],
          ),
        ),
      ),
    );
  }

  void submitForm(){
    if(formStateKey.currentState.validate()){//key đã được khởi tạo ở trên ,key để tìm Scaffold để thực hiện gọi hàm validate
      print('truoc khi save : Ten: ${user.name} va tuoi: ${user.age}');
      formStateKey.currentState.save();//key đã được khởi tạo ở trên ,key để tìm Scaffold để thực hiện gọi hàm save
      print('sau khi save : Ten: ${user.name} va tuoi: ${user.age}');
    }else{
      print('Validate that bai. Vui long thu lai');
    }
  }

  String validateTen(String value) {
    if (value.isEmpty) {
      return 'Ten khong duoc de trong';
    } else {
      return null;
    }
  }

  String validateTuoi(String value) {
    try {
      if (int.tryParse(value) < 18) {
        return 'Phim cam tre em duoi 18+_';
      } else {
        return null;
      }
    } catch (e) {
      return 'Yeu cau nhap so . khong nhap chu cai hoac ky tu';
    }
  }

  void saveTen(String inputName) {
    user.name = inputName;
  }

  void saveTuoi(String inputAge) {
    user.age = int.tryParse(inputAge);
  }

}
