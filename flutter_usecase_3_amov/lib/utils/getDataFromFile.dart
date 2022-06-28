import 'dart:io';
import 'dart:math';

final _random = new Random();

/**
 * Generates a positive random integer uniformly distributed on the range
 * from [min], inclusive, to [max], exclusive.
 */
int randomNumber(int min, int max) => min + _random.nextInt(max - min);

Future<List<int>> getDataFromFile(String _filePathAndName) async {
  /**
  * The path_provider package provides a platform-agnostic way to access commonly used locations on the device’s file system.
  * The plugin currently supports access to two file system locations:
  *
  * Temporary directory
  *   A temporary directory (cache) that the system can clear at any time. On iOS, this corresponds to the NSCachesDirectory.
  *   On Android, this is the value that getCacheDir() returns.
  *
  * Documents directory
  *   A directory for the app to store files that only it can access. The system clears the directory only when the app is deleted.
  *    On iOS, this corresponds to the NSDocumentDirectory. On Android, this is the AppData directory.

  This example stores information in the documents directory. You can find the path to the documents directory as follows:
  */
  List<int> readed = List(2);

  /** NOTE
   * To get information about a path, you can use the FileSystemEntity static methods such as 'isDirectory',
   * 'isFile', and 'exists'. Because file system access involves I/O, these methods are 
   * asynchronous and return a Future. 
  */
  // TODO try catch?
  if (await File(_filePathAndName).exists() == false) {
    //*create & generate 2 random numbers
    await File(_filePathAndName) //? havia o problema pela falta do await
        .create(
            recursive:
                false) // recursive is to also create the directories is they don't exist
        .then((File file) async {
      readed[0] = randomNumber(10000, 99999);
      readed[1] = randomNumber(10000, 99999);
      file.writeAsString('${readed[0]}\n${readed[1]}');
    });
  } else {
    // *if exists open it and used the 2 number that exist
    List<String> str_aux = File(_filePathAndName).readAsLinesSync();
    readed[0] = int.parse('${str_aux[0]}') - 1;
    readed[1] = int.parse('${str_aux[1]}') + 1;
    File(_filePathAndName).writeAsStringSync('${readed[0]}\n${readed[1]}');
  }
  return readed;
}
