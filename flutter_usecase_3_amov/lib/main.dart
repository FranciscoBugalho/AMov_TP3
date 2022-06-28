import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_usecase_3_amov/utils/getPath.dart' as getPath;
import 'package:flutter_usecase_3_amov/myIsolate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 3 Usecase - Threading',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter 3 Usecase - Threading'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fileName = '/two_numbers.txt';
  final sendPortName = 'numbers_send_port';
  bool _isRunning = false;
  bool _isIsolateExists = false;
  Capability _capability;
  int number1;
  int number2;
  int _timer = 10;
  ReceivePort receivePort = ReceivePort();
  Isolate _isolate;

  void pauseIsolate() async {
    _capability = _isolate.pause();
  }

  void resumeIsolate() {
    _isolate.resume(_capability);
  }

  Future _myIsolate() async {
    String _filePathAndName = await getPath.getPath() + fileName;

    IsolateNameServer.registerPortWithName(receivePort.sendPort, sendPortName);

    _isolate = await Isolate.spawn(isolateWork,
        IsolateMessageInput(_filePathAndName, receivePort.sendPort, _timer));

    receivePort.listen((dynamic data) {
      List<int> twoNumbers = data;
      _isIsolateExists = true;
      _isRunning = true;
      number1 = twoNumbers[0];
      number2 = twoNumbers[1];
      _capability = _isolate.pause();
      _isolate.resume(_capability);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {
                  if (!_isIsolateExists) {
                    _myIsolate(); 
                    _isIsolateExists = true;
                  } else {
                    if (_isRunning) {
                      pauseIsolate();
                      _isRunning = false;
                    } else {
                      resumeIsolate();
                      _isRunning = true;
                    }
                  }
                  setState(() {});
                },
                child: Icon(_isRunning ? Icons.pause : Icons.play_arrow)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {
                  if(_isIsolateExists) {
                      _isolate.kill();
                      _isIsolateExists = false;
                      _isRunning = false;
                      receivePort = ReceivePort();
                      number1 = -1;
                      number2 = -1;
                      setState(() {});
                  }
                },
                child: Icon(_isRunning ? null : Icons.stop)),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 7,
              ),
              Text(
                'This is what is going to happen\n\n👇',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                'There\'s another isolate ready to open (or create) a file and read it\'s two numbers.' +
                    'It will modify and save the numbers into the file, and then rest. After 10 seconds, the process repeats.\n\n',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Spacer(),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: number1 == -1 ? Text('🧐',style: new TextStyle(fontSize: 18.0)) : Text('1st Number'),
                  ),
                  Text(
                    '${intNullSafety(number1)}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ]),
                Spacer(),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: number2 == -1 ? Text('🧐',style: new TextStyle(fontSize: 18.0)) : Text('2nd Number'), 
                  ),
                  Text(
                    '${intNullSafety(number2)}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ]),
                Spacer(),
              ]),
              Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }
}

String intNullSafety(int num) {
  return num?.toString() ?? '';
}
