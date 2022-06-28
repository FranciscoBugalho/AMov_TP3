import 'dart:io';
import 'dart:isolate';
import 'package:flutter_usecase_3_amov/utils/getDataFromFile.dart'
    as getfiledata;

class IsolateMessageInput {
  final String _filePathAndName;
  final SendPort _sendPort;
  final int _timer;
  IsolateMessageInput(this._filePathAndName, this._sendPort, this._timer);
}

void isolateWork(var input) async {
  var aux;
  while (true) {
    aux = await getfiledata.getDataFromFile(input._filePathAndName);
    //print('----> Computei: $aux');
    input._sendPort.send(aux);
    await Future.delayed(Duration(seconds: input._timer));
  }
}
