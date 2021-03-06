import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: MasterDetailPage(),);
  }
}

typedef Null ItemSelectedCallBack(int value);

class ListWidget extends StatefulWidget {
  final int count;
  final ItemSelectedCallBack onItemSelected;

  ListWidget(this.count, this.onItemSelected);
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fragment One'),),
      body: Container(color: Colors.green,
        child:
      ListView.builder(
        itemCount: widget.count,
        itemBuilder: (context, position){
          return Padding(
              padding: const EdgeInsets.all(8.0),
            child: Card(
              child: InkWell(
                onTap: (){
                  widget.onItemSelected(position);
                  //Get.to(DetailWidget(position));
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                      child: Text(position.toString(),style: TextStyle(fontSize: 22.0),),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    )));
  }
}

class DetailWidget extends StatefulWidget {
  final int data;
  DetailWidget(this.data);
  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fragment Two'),),
      body: Container(
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.data.toString(),style: TextStyle(fontSize: 36.0,color: Colors.white),)
          ],
        ),
      ),
    ));
  }
}

class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  var selectedValue = 0;
  var isLargeScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context,orientation){
        if(MediaQuery.of(context).size.width>600){
          isLargeScreen = true;
        }
        else isLargeScreen = false;
        return Row(
          children: <Widget>[
            Expanded(
                child:ListWidget(10,(value){
                  if (isLargeScreen){
                    selectedValue = value;
                    setState(() {

                    });
                  }
                  else {
                    Get.to(DetailPage(value));
                  }
                })
            ),
            isLargeScreen? Expanded(child:
              DetailWidget(selectedValue)): Container(),
          ],
        );
      },),
    );
  }
}

class DetailPage extends StatefulWidget {
  final int data;
  DetailPage(this.data);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DetailWidget(widget.data),
    );
  }
}



