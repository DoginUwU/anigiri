import 'package:anigiri/models/backend.dart';
import 'package:anigiri/widgets/image_card.dart';
import 'package:flutter/material.dart';

class Images extends StatefulWidget {
  final String title;
  final VoidCallback? onRequestFetch;
  final List<SearchItemBackend> items;

  const Images({
    Key? key,
    required this.title,
    required this.items,
    this.onRequestFetch,
  }) : super(key: key);

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.onRequestFetch?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      child: Column(
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
            children: widget.items
                .map(
                  (item) => ImageCard(
                    item: item,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
