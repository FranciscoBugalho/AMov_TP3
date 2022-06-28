import 'package:flutter/material.dart';
import './screens/complex.dart';
import './screens/numbers.dart';
import './screens/words.dart';
import './screens/homePage.dart';
import './utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static final List<int> _numbers = List<int>();
  static final List<String> _words = List<String>();
  static final List<String> _iconsNamesChossen = [];
  static const qtdNumebs = 1000;
  static const qtdWords = 500;
  static const qtdIcons = 750;

  static populateAllData() {
    generateNumbers(_numbers, qtd: qtdNumebs);
    populateWordsList(_words, qtdWords);
    getIconsNamesFromMap(_iconsNamesChossen, qtdIcons);
  }

  MyApp() {
    populateAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2 Usecase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(),
        Numbers.route: (context) => Numbers(_numbers),
        WordsScreen.route: (context) => WordsScreen(_words),
        Complex.route: (context) => Complex(_iconsNamesChossen, 600),
      },
    );
  }
}
