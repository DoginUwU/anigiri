import 'package:anigiri/services/globals.dart' as globals;
import 'package:anigiri/services/path.dart';
import 'package:anigiri/widgets/dropdown_option.dart';
import 'package:anigiri/widgets/go_back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restart_app/restart_app.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<void> changeWebsite(String? website) async {
    if (website == null || website.isEmpty) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    globals.currentWebsite = website;
    globals.restartRequired = true;
    prefs.setString("currentWebsite", website);
    Restart.restartApp();
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
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          selectedItem: globals.currentWebsite,
                          onChange: changeWebsite,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Choose download path"),
                                ElevatedButton(
                                  onPressed: () async {
                                    await changeDownloadPath(context);
                                    setState(() {});
                                  },
                                  child: const Text("Choose download folder"),
                                ),
                              ],
                            ),
                            Text(globals.downloadPath),
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
