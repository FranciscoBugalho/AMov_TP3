import 'dart:ui';

import 'package:flutter/material.dart';

class Numbers extends StatelessWidget {
  static const String route = "numbers";
  final List<int> _numbers;
  Numbers(this._numbers);

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 1000; i++) _numbers.add(i);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numbers\'s List'),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: _numbers.length,
        padding: const EdgeInsets.only(top: 50),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        controller: ScrollController(),
        itemBuilder: (context, _index) {
          return Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(
              '${_numbers[_index]}',
              style: TextStyle(color: Colors.black54, fontSize: 22),
            ),
          );
        },
      ),
    );
  }
}
