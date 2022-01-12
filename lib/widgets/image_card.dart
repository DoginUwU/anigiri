import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        'https://img3.gelbooru.com//images/92/ae/92ae98b1f38dbb8d43c617d86ba6e0ac.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
