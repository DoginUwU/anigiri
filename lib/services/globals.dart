import 'package:anigiri/models/backend.dart';

String searchString = "";
List<String> websites = [];
SearchBackend? search;
String currentWebsite = "";
String downloadPath = "";
bool initialized = false;
bool restartRequired = false;
