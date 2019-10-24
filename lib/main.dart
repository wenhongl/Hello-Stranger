import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new Scaffold(
        drawer: Drawer(
          child: ListTile(
            leading: Icon(Icons.change_history),
          ),
          elevation: 20.0,
        ),
        appBar: new AppBar(
          title: new Text('Home')
        ),
        body: new Center(
        // body:  Image.network('https://flutter.io/images/owl.jpg'),
          child: HomeScreen(),
          // child: new Text('Hello World'),
        ),
        // backgroundColor: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
      ),
      );
  }
}