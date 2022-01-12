import 'dart:convert';
import 'package:anigiri/services/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:anigiri/models/backend.dart';

const baseUrl = "https://anigiri-back.herokuapp.com/";

Future<MainBackend> getIndex() async {
  final url = Uri.parse(baseUrl);
  final response = await http.get(url);

  try {
    final json = jsonDecode(response.body);
    return MainBackend.fromJson(json);
  } catch (e) {
    await Future.delayed(const Duration(seconds: 5));
    return getIndex();
  }
}

Future<SearchBackend> searchByTags(String tags, int page) async {
  final url = Uri.parse(
      baseUrl + "search?tags=$tags&site=${globals.currentWebsite}&page=$page");
  final response = await http.get(url);

  try {
    final json = jsonDecode(response.body);
    return SearchBackend.fromJson(json);
  } catch (e) {
    await Future.delayed(const Duration(seconds: 5));
    return searchByTags(tags, page);
  }
}
