import 'package:flutter/material.dart';

class DetailTag extends StatelessWidget {
  final String title;

  const DetailTag({Key? key, required this.title}) : super(key: key);

  void onTap(BuildContext context) {
    Navigator.of(context)
        .pushNamed('/search', arguments: title.replaceAll(RegExp('\\s+'), '_'));
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.green[500],
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
