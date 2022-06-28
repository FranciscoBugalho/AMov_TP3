import 'package:flutter/material.dart';
import 'package:flutter_usecase_2_amov/utils/utils.dart';

class Complex extends StatelessWidget {
  static const String route = "complex";
  final List<String> _iconsChoosen;
  final int qtd;
  Complex(this._iconsChoosen, this.qtd);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lets Scrool some flutter Icons!'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
          itemCount: qtd,
          itemBuilder: (context, index) {
            return Container(
              width: 10,
              color: index % 2 == 0
                  ? Colors.deepPurpleAccent[200]
                  : Colors.deepPurpleAccent[400],
              height: 100,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 75,
                    alignment: Alignment.centerRight,
                    child: Text('$index',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    //child: Column(
                    //mainAxisAlignment: AxisAlignment.center,
                    //children: [
                    child: Icon(
                      getIcon(_iconsChoosen[index]),
                      size: 45,
                      color: Colors.white,
                    ),
                    // ],
                    // ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        '${_iconsChoosen[index]}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
