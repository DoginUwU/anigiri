import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(const Anigiri());
}

class Anigiri extends StatelessWidget {
  const Anigiri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(child: Home()),
    );
  }
}
