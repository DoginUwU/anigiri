import 'package:anigiri/models/backend.dart';
import 'package:anigiri/services/backend.dart';
import 'package:anigiri/services/download.dart';
import 'package:anigiri/widgets/go_back_app_bar.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<PostItemBackend> item = callApi();

  Future<PostItemBackend> callApi() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as SearchItemBackend;

    return await getPostApi(args.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostItemBackend>(
      future: item,
      builder: (ctx, snapshot) {
        var data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.done && data != null) {
          return Build(item: data);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class Build extends StatelessWidget {
  final PostItemBackend item;

  const Build({
    Key? key,
    required this.item,
  }) : super(key: key);

  void downloadImage() {
    download(item.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[500],
        child: Column(
          children: [
            GoBackAppBar(
              title: item.copyright,
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
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loading.gif',
                                image: item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => downloadImage(),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue[500]),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                minimumSize: MaterialStateProperty.all(
                                  const Size.fromHeight(40),
                                ),
                              ),
                              child: const Text("Download"),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
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
