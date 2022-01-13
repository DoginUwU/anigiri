import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> getPathToDownload() async {
  try {
    var directory = await getDownloadsDirectory();
    if (directory != null) {
      return directory.path;
    } else {
      return await getStorageDirectory();
    }
  } catch (e) {
    return await getStorageDirectory();
  }
}

Future<String> getStorageDirectory() async {
  if (Platform.isAndroid) {
    return '/storage/emulated/0/Download';
  } else {
    return (await getApplicationDocumentsDirectory()).path;
  }
}

Future<Directory> findRoot() async {
  var directory = Directory('/storage/emulated/0/');

  return directory;
}
