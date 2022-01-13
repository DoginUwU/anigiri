import 'dart:io';

import 'package:anigiri/services/globals.dart' as globals;
import 'package:anigiri/services/path.dart';
import 'package:anigiri/widgets/default_app_bar.dart';
import 'package:anigiri/widgets/dropdown_option.dart';
import 'package:anigiri/widgets/go_back_app_bar.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<void> changeDownloadPath(BuildContext context) async {
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
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[500],
        child: Column(
          children: [
            const GoBackAppBar(title: 'Settings'),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "General",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        DropDownOption(
                          title: 'Choose website',
                          items: globals.websites,
                          selectedItem: globals.websites[0],
                          onChange: (p0) {},
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Text(globals.downloadPath),
                            ElevatedButton(
                              onPressed: () => changeDownloadPath(context),
                              child: const Text("Choose download folder"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
