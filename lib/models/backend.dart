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

class PostItemBackend {
  final String id;
  final String image;
  final String artist;
  final String copyright;
  final List<dynamic> tags;
  final List<SearchItemBackend>? sames;

  PostItemBackend({
    required this.id,
    required this.image,
    required this.artist,
    required this.copyright,
    required this.tags,
    this.sames,
  });

  factory PostItemBackend.fromJson(final json) {
    return PostItemBackend(
      id: json['id'],
      image: json['image'],
      artist: json['artist'],
      copyright: json['copyright'],
      tags: json['tags'],
      sames: [
        for (final item in json['sames']) SearchItemBackend.fromJson(item),
      ],
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
