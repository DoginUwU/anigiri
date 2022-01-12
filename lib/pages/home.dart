import 'package:anigiri/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:anigiri/widgets/default_app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[500],
        child: Column(
          children: [
            const DefaultAppBar(),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: const Images(
                  title: 'Tudo',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
