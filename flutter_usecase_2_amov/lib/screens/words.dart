import 'package:flutter/material.dart';

class WordsScreen extends StatelessWidget {
  static const String route = "words";
  final List<String> words;
  WordsScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Words\'s List'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: words.length,
          padding: EdgeInsets.only(top: 25, left: 100),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          controller: ScrollController(),
          itemBuilder: (context, _index) {
            return Container(
                child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 30.0, right: 15.0),
                  child: Text(
                    '$_index',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 15.0, right: 15.0),
                    child: Text('${words[_index]}',
                    style: TextStyle(color: Colors.black54, fontSize: 22),
                    )
                    ),
              ],
            ));
          },
        ),
      ),
    );
  }
}
