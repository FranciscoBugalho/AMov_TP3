import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Episode 1: The Story of a TextField',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Text Travel Machine'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fieldText = TextEditingController();
  String imAString = "waiting ...";

  void _updateText() {
    setState(() {});
  }

  void _clearText() {
    imAString = "";
    fieldText.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              "Write your text into the teleport machine and activate it!",
              style:
                  TextStyle(fontSize: 24, letterSpacing: 0.2, wordSpacing: 1.0),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            TextField(
                onChanged: (input) {
                  imAString = input;
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: fieldText),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.blueAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  imAString,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 125,
                  height: 37,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.blueAccent,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.clear_outlined),
                    onPressed: _clearText,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 125,
                  height: 37,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.blueAccent,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.update),
                    onPressed: _updateText,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
