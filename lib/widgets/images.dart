import 'package:anigiri/widgets/image_card.dart';
import 'package:flutter/material.dart';

class Images extends StatefulWidget {
  final String title;

  const Images({Key? key, required this.title}) : super(key: key);

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: const [
            ImageCard(),
            ImageCard(),
            ImageCard(),
            ImageCard(),
            ImageCard(),
            ImageCard(),
            ImageCard(),
            ImageCard(),
            ImageCard(),
          ],
        )
      ],
    );
  }
}
