import 'package:anigiri/services/utils.dart';
import 'package:anigiri/widgets/default_navigation_bar.dart';
import 'package:anigiri/services/globals.dart' as globals;
import 'package:anigiri/widgets/images.dart';
import 'package:anigiri/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int page = 1;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final searchString =
          ModalRoute.of(context)!.settings.arguments as String?;

      if (searchString != null) {
        handleSearch(searchString);
      }
    });
  }

  Future<void> handleSearch(String query) async {
    setState(() {
      isLoading = true;
      page = 1;
    });
    await searchByTags(context, query, page, true);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const DefaultNavigationBar(),
      body: Container(
        color: Colors.blue[500],
        child: Column(
          children: [
            SearchAppBar(
              onSubmitted: handleSearch,
            ),
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
                        title: 'Searching: ${globals.searchString}',
                        items: globals.search?.items ?? [],
                        onRequestFetch: () async {
                          if (isLoading) return;

                          setState(() {
                            isLoading = true;
                          });
                          await searchByTags(
                              context, globals.searchString, page + 1, false);
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
