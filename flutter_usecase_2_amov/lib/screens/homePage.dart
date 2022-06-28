import 'package:flutter/material.dart';
import 'package:flutter_usecase_2_amov/screens/complex.dart';
import 'package:flutter_usecase_2_amov/screens/words.dart';
import '../screens/numbers.dart';
import 'package:flutter_usecase_2_amov/main.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 100),
            const Text(
              'Listas de dados',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            const Spacer(flex: 2),
            // const IconButton(
            //   icon: Icon(Icons.repeat_rounded),
            //   onPressed: MyApp.populateAllData,
            //   iconSize: 40,
            // ),
            const Spacer(flex: 5),
            FlatButton(
              minWidth: 180,
              child: const Text('Numbers',
                  style: const TextStyle(
                      fontSize: 22, letterSpacing: 0.4, color: Colors.black87)),
              color: Colors.green,
              onPressed: () => Navigator.pushNamed(context, Numbers.route),
            ),
            const Spacer(flex: 5),
            FlatButton(
              minWidth: 180,
              child: const Text('Words',
                  style: const TextStyle(
                      fontSize: 22, letterSpacing: 0.4, color: Colors.black87)),
              color: Colors.orange,
              onPressed: () => Navigator.pushNamed(context, WordsScreen.route),
            ),
            const Spacer(flex: 5),
            FlatButton(
              minWidth: 180,
              child: const Text('Complex',
                  style: const TextStyle(
                      fontSize: 22, letterSpacing: 0.4, color: Colors.black87)),
              color: Colors.deepPurpleAccent,
              onPressed: () {
                return Navigator.pushNamed(context, Complex.route);
              },
            ),
            const Spacer(flex: 8),
            const IconButton(
              icon: Icon(Icons.repeat_rounded),
              onPressed: MyApp.populateAllData,
              iconSize: 40,
            ),
            Spacer(flex: 100),
          ],
        ),
      ),
    );
  }
}
