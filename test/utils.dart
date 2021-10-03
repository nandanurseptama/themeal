import 'dart:io';

String readFile({required String path}){
  return File(path).readAsStringSync();
}