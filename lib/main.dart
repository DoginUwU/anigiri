import 'package:anigiri/pages/settings.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(const Anigiri());
}

class Anigiri extends StatelessWidget {
  const Anigiri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anigiri',
      initialRoute: '/',
      routes: {
        '/': (context) => const SafeArea(child: Home()),
        '/settings': (context) => const SafeArea(child: Settings()),
      },
    );
  }
}
