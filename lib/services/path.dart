import 'dart:io';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:anigiri/services/globals.dart' as globals;

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

Future<void> changeDownloadPath(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Directory rootDir = await findRoot();

  String? path = await FilesystemPicker.open(
    title: 'Save to folder',
    context: context,
    rootDirectory: rootDir,
    fsType: FilesystemType.folder,
    pickText: 'Save files to this folder',
    folderIconColor: Colors.blue[500],
  );

  if (path != null) {
    globals.downloadPath = path;
    prefs.setString('downloadsPath', path);
  }
}
