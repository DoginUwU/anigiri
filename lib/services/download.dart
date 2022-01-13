import 'dart:isolate';
import 'dart:ui';

import 'package:anigiri/services/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:anigiri/services/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

ReceivePort _port = ReceivePort();

Future<void> initializeDownloads() async {
  await FlutterDownloader.initialize(debug: true);
  FlutterDownloader.registerCallback(callback);
  IsolateNameServer.registerPortWithName(
      _port.sendPort, 'downloader_send_port');

  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? downloadsPath = prefs.getString('downloadsPath');

  if (downloadsPath == null || downloadsPath.isEmpty) {
    downloadsPath = await getPathToDownload();
  }

  globals.downloadPath = downloadsPath;
  prefs.setString('downloadsPath', downloadsPath);
}

void callback(String id, DownloadTaskStatus status, int progress) {
  final SendPort send =
      IsolateNameServer.lookupPortByName('downloader_send_port')!;
  send.send([id, status, progress]);
}

void download(String url) async {
  Fluttertoast.showToast(
    msg: "Download started",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green[500],
    textColor: Colors.white,
    fontSize: 16.0,
  );

  await FlutterDownloader.enqueue(
    url: url,
    savedDir: globals.downloadPath,
    showNotification: true,
    openFileFromNotification: true,
  );
}
