import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black
      ),
      home: widgetHome(),
    );
  }
}
 
class widgetHome extends StatelessWidget {
  const widgetHome({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Hello"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text("Hello Paloma!",
          style: TextStyle(
            fontSize: 36,
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.underline,
            //decoration: TextDecoration.overline,
            decorationColor: Colors.grey,
            decorationStyle: TextDecorationStyle.dashed,
          )),
        ),
      ),
    );
  }
}
