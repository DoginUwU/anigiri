import 'package:anigiri/models/backend.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  final SearchItemBackend item;

  const ImageCard({Key? key, required this.item}) : super(key: key);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/detail', arguments: widget.item);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          widget.item.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
