import 'package:flutter/material.dart';
import 'package:anigiri/services/globals.dart' as globals;

class DefaultAppBar extends StatefulWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              globals.currentWebsite,
              style: const TextStyle(
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
