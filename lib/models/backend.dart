class MainBackend {
  final String app;
  final bool running;
  final List<dynamic> availableSites;

  MainBackend({
    required this.app,
    required this.running,
    required this.availableSites,
  });

  factory MainBackend.fromJson(final json) {
    return MainBackend(
      app: json['app'],
      running: json['running'],
      availableSites: json['availableSites'],
    );
  }
}

class SearchItemBackend {
  final String id;
  final String url;
  final String image;

  SearchItemBackend({
    required this.id,
    required this.url,
    required this.image,
  });

  factory SearchItemBackend.fromJson(final json) {
    return SearchItemBackend(
      id: json['id'],
      url: json['url'],
      image: json['image'],
    );
  }
}

class SearchBackend {
  final int currentPage;
  final int nextPage;
  final String nextPageUrl;
  final List<SearchItemBackend> items;

  SearchBackend({
    required this.currentPage,
    required this.nextPage,
    required this.nextPageUrl,
    required this.items,
  });

  factory SearchBackend.fromJson(final json) {
    return SearchBackend(
      currentPage: json['currentPage'],
      nextPage: json['nextPage'],
      nextPageUrl: json['nextPageUrl'],
      items: [
        for (final item in json['items']) SearchItemBackend.fromJson(item),
      ],
    );
  }
}
