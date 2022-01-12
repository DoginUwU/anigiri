import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: const Align(
        alignment: Alignment.center,
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: 'Search...',
          ),
        ),
      ),
    );
  }
}
