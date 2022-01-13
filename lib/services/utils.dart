import 'package:anigiri/models/backend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:anigiri/services/globals.dart' as globals;

import 'backend.dart';

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }

  (context as Element).visitChildren(rebuild);
}

Future<void> searchByTags(
    BuildContext context, String tags, int page, bool empty) async {
  EasyLoading.show(status: 'loading...');

  await searchByTagsApi(tags, page).then((value) {
    Iterable<SearchItemBackend> items =
        (globals.search?.items.toList() ?? []) + value.items;

    if (empty == true) {
      items = items.skip(globals.search?.items.length ?? 0);
    }

    globals.searchString = tags;

    if (items.length > 900) {
      items = items.skip(250);
    }

    globals.search = value;
    globals.search!.items.clear();
    globals.search!.items.addAll(items);

    EasyLoading.dismiss();
    rebuildAllChildren(context);
  });
}
