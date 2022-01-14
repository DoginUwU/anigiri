import 'package:anigiri/pages/detail.dart';
import 'package:anigiri/pages/splash.dart';
import 'package:anigiri/pages/terms.dart';
import 'package:anigiri/services/globals.dart' as globals;
import 'package:anigiri/services/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:anigiri/pages/search.dart';
import 'package:anigiri/pages/settings.dart';
import 'package:anigiri/services/backend.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home.dart';

void main() {
  runApp(const Anigiri());
}

class Anigiri extends StatelessWidget {
  const Anigiri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    getIndexApi().then((a) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final sites = a.availableSites.cast<String>();
      globals.websites = sites;
      globals.currentWebsite = prefs.getString("currentWebsite") ?? sites[0];
      rebuildAllChildren(context);
    });

    return MaterialApp(
      title: 'Anigiri',
      initialRoute: '/splash',
      routes: {
        '/': (context) => const Home(),
        '/settings': (context) => const Settings(),
        '/search': (context) => const Search(),
        '/detail': (context) => const Detail(),
        '/splash': (context) => const Splash(),
        '/terms': (context) => const Terms(),
      },
      builder: EasyLoading.init(),
    );
  }
}
