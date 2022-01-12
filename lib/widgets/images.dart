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
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            physics: const BouncingScrollPhysics(),
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
          ),
        )
      ],
    );
  }
}
