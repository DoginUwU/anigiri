import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Gelbooru - All",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextButton(
              onPressed: () {
                String? currentRoute = ModalRoute.of(context)?.settings.name;
                if (currentRoute != "/settings") {
                  Navigator.pushNamed(context, '/settings');
                } else {
                  Navigator.pushNamed(context, '/');
                }
              },
              child: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
