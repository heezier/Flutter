import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'ListPage.dart';
import 'NewPage.dart';


void main() {
  runApp(MyApp());
}
class User {
  String name;
  int age;

  String toString(){
    return ("name:" + this.name + " age:" + this.age.toString());
  }
  User({this.name, this.age});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //新建english_words包中的词库
    final wordPair = new WordPair.random();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "home": (context) => MyHomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "newpage") {
          final User args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return Newpage(
              user: args,
            );
          });
        }
      },
      home: MyHomePage(title: wordPair.asPascalCase),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String reciveString = "接受的值：";

  void startNewPage() {
//     Navigator.push(context,
//        MaterialPageRoute(builder: (context) => Newpage()));

//     Navigator.pushNamed(context, "newpage");


//    Navigator.pushNamed(context, "newpage", arguments: User(name: "Zgg01",age: 23));

  //处理返回的值
     Navigator.pushNamed(context, "newpage", arguments: User(name: "Zgg01",age: 23))
              .then((value) => {
                 setState(() {
                   reciveString = value.toString();
                  })
               });


  }
  void startListPage() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListPage()));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '路由跳转',
            ),
            Text(
              '$reciveString',
//              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
                child: Text('ListView'),
                onPressed: startListPage,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startNewPage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
