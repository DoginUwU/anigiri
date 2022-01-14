import 'package:flutter/material.dart';

class GoBackAppBar extends StatefulWidget {
  final String title;

  const GoBackAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _GoBackAppBarState createState() => _GoBackAppBarState();
}

class _GoBackAppBarState extends State<GoBackAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
