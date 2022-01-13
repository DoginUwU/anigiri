import 'dart:ui';

import 'package:anigiri/services/download.dart';
import 'package:anigiri/services/globals.dart' as globals;
import 'package:anigiri/services/utils.dart';
import 'package:anigiri/widgets/default_navigation_bar.dart';
import 'package:anigiri/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:anigiri/widgets/default_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 1;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeDownloads();
    searchByTags(context, 'all', page, true)
        .then((a) => {setState(() => isLoading = false)});
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const DefaultNavigationBar(),
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
                child: Row(
                  children: [
                    Expanded(
                      child: Images(
                        title: 'All',
                        items: globals.search?.items ?? [],
                        onRequestFetch: () async {
                          if (isLoading) return;

                          setState(() {
                            isLoading = true;
                          });
                          await searchByTags(context, 'all', page + 1, false);
                          setState(() {
                            page += 1;
                            isLoading = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
