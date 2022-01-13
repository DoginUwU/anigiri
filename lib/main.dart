import 'package:anigiri/services/globals.dart' as globals;
import 'package:anigiri/services/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:anigiri/pages/search.dart';
import 'package:anigiri/pages/settings.dart';
import 'package:anigiri/services/backend.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(const Anigiri());
}

class Anigiri extends StatelessWidget {
  const Anigiri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getIndexApi().then((a) {
      final sites = a.availableSites.cast<String>();
      globals.websites = sites;
      globals.currentWebsite = sites[0];
      rebuildAllChildren(context);
    });

    return MaterialApp(
      title: 'Anigiri',
      initialRoute: '/',
      routes: {
        '/': (context) => const SafeArea(child: Home()),
        '/settings': (context) => const SafeArea(child: Settings()),
        '/search': (context) => const SafeArea(child: Search()),
      },
      builder: EasyLoading.init(),
    );
  }
}
