/// 新闻分页 request
class NewsPageListRequestEntity {
  String categoryCode;
  String channelCode;
  String tag;
  String keyword;

  NewsPageListRequestEntity({
    this.categoryCode,
    this.channelCode,
    this.tag,
    this.keyword,
  });
}

// To parse this JSON data, do
//
//     final newsPageListResponseEntity = newsPageListResponseEntityFromJson(jsonString);

/// 新闻分页 response
class NewsPageListResponseEntity {
  NewsPageListResponseEntity({
    this.counts,
    this.pagesize,
    this.pages,
    this.page,
    this.items,
  });

  int counts;
  int pagesize;
  int pages;
  int page;
  List<NewsItem> items;

  factory NewsPageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      NewsPageListResponseEntity(
        counts: json["counts"],
        pagesize: json["pagesize"],
        pages: json["pages"],
        page: json["page"],
        items:
            List<NewsItem>.from(json["items"].map((x) => NewsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "counts": counts,
        "pagesize": pagesize,
        "pages": pages,
        "page": page,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class NewsItem {
  NewsItem({
    this.id,
    this.category,
    this.thumbnail,
    this.addtime,
    this.title,
    this.author,
    this.url,
  });

  String id;
  String category;
  String thumbnail;
  DateTime addtime;
  String title;
  String author;
  String url;

  factory NewsItem.fromJson(Map<String, dynamic> json) => NewsItem(
        id: json["id"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        addtime: DateTime.parse(json["addtime"]),
        title: json["title"],
        author: json["author"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "thumbnail": thumbnail,
        "addtime": addtime.toIso8601String(),
        "title": title,
        "author": author,
        "url": url,
      };
}
// To parse this JSON data, do
//
//     final newsRecommendResponseEntity = newsRecommendResponseEntityFromJson(jsonString);

class NewsRecommendResponseEntity {
  NewsRecommendResponseEntity({
    this.thumbnail,
    this.title,
    this.category,
    this.addtime,
    this.author,
    this.url,
    this.id,
  });

  String thumbnail;
  String title;
  String category;
  DateTime addtime;
  String author;
  String url;
  String id;

  factory NewsRecommendResponseEntity.fromJson(Map<String, dynamic> json) =>
      NewsRecommendResponseEntity(
        thumbnail: json["thumbnail"],
        title: json["title"],
        category: json["category"],
        addtime: DateTime.parse(json["addtime"]),
        author: json["author"],
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "title": title,
        "category": category,
        "addtime": addtime.toIso8601String(),
        "author": author,
        "url": url,
        "id": id,
      };
}

/// 新闻推荐 request
class NewsRecommendRequestEntity {
  String categoryCode;
  String channelCode;
  String tag;
  String keyword;

  NewsRecommendRequestEntity({
    this.categoryCode,
    this.channelCode,
    this.tag,
    this.keyword,
  });
}
