
import 'package:flutter/material.dart';

import 'main.dart';



class Newpage extends StatelessWidget {
//  Newpage({Key key, this.title}) : super(key: key);

  final User user;
  Newpage({this.user});


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    //构造获取传递过来的参数user
    return Scaffold(appBar: AppBar(title: Text("第二页"),),
      body: Center(child: RaisedButton(
          child: Text('传递的参数：' + user.toString()),
          onPressed: () {
            Navigator.pop(context, User(name: "Forever",age: 20));
          }),),);
  }


//  @override
//  Widget build(BuildContext context) {
//    //构造获取传递过来的参数user
//    final User user = ModalRoute.of(context).settings.arguments;
//    return Scaffold(appBar: AppBar(title: Text("第二页"),),
//      body: Center(child: RaisedButton(
//          child: Text('传递的参数：' + user.toString()),
//          onPressed: () {
//            Navigator.pop(context);
//          }),),);
//  }



}
