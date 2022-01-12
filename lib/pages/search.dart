import 'package:anigiri/widgets/default_navigation_bar.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const DefaultNavigationBar(),
      body: Container(
        color: Colors.blue[500],
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
