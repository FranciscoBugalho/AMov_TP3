import 'dart:io';
//import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// Future<File> get _localFile async {
//   final path = await _localPath;
//   return File('$path/counter.txt');
// }

Future<String> configureFile() async {
  const String _fileName = "two_numbers.txt";
  print('Iniciei o configure file. ainda não cheguei a nenhum await.');
  /**
  * The path_provider package provides a platform-agnostic way to access commonly used locations on the device’s file system. The plugin currently supports access to two file system locations:
  *
  * Temporary directory
  * A temporary directory (cache) that the system can clear at any time. On iOS, this corresponds to the NSCachesDirectory. On Android, this is the value that getCacheDir() returns.
  *
  *  Documents directory
  *   A directory for the app to store files that only it can access. The system clears the directory only when the app is deleted. On iOS, this corresponds to the NSDocumentDirectory. On Android, this is the AppData directory.
  *
  * This example stores information in the documents directory. You can find the path to the documents directory as follows:
  *   Future<String> get _localPath async {
  *   final directory = await getApplicationDocumentsDirectory();
*/
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String _appDocPath = appDocDir.path;

  // ignore: todo
  // TODO check if it failed
  final String _filePathAndName = '$_appDocPath/$_fileName';

  /** NOTE
   * To get information about a path, you can use the FileSystemEntity static methods such as 'isDirectory',
   * 'isFile', and 'exists'. Because file system access involves I/O, these methods are 
   * *asynchronous and return a Future. 
  */

  print('file path gathered  ->> $_filePathAndName  <<-  ');

  bool exist = await File(_filePathAndName).exists();
  String returnedStr;
  if (true) {
    File(_filePathAndName)
        .create(
            recursive:
                false) // recursive is to also create the directories is they don't exist
        .then((File file) async {
      //print('criei o ficheiro');
      await file.writeAsString('22 22');
      print('crerated and writed 22 22 to the file');
      returnedStr = await file.readAsString();
      //print('li o aux($aux). vou enviar.');
      //print(File(_filePathAndName).readAsStringSync());
    });
  } else {}
  return returnedStr;

  // await File(_filePathAndName).exists().then((exist) => {
  //       if (true)
  //         {
  //           File(_filePathAndName)
  //               .create(
  //                   recursive:
  //                       false) // recursive is to also create the directories is they don't exist
  //               .then((File file) async {
  //             //print('criei o ficheiro');
  //             await file.writeAsString('22 22');
  //             print('crerated and writed 22 22 to the file');
  //             return await file.readAsString();
  //             //print('li o aux($aux). vou enviar.');
  //             //print(File(_filePathAndName).readAsStringSync());
  //           })
  //         }
  //       else
  //         {}
  //});
}

class MyIsolatedFunction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
