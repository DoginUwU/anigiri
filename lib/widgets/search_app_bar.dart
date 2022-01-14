import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget {
  final void Function(String) onSubmitted;

  const SearchAppBar({Key? key, required this.onSubmitted}) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 5, 18, 18),
        child: Align(
          alignment: Alignment.center,
          child: TextField(
            obscureText: false,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'Search...',
            ),
            onSubmitted: widget.onSubmitted,
          ),
        ),
      ),
    );
  }
}
