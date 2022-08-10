// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromJson(jsonString);

import 'dart:convert';

NewsResponse newsResponseFromJson(String str) => NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
  NewsResponse({
    this.status,
    this.totalResults,
    required this.articles,
  });

  String? status;
  int? totalResults;
  List<Article> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? json["author"],
        title: json["title"],
        description: json["description"] ?? json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] ?? json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author ?? author,
        "title": title,
        "description": description ?? description,
        "url": url,
        "urlToImage": urlToImage ?? urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content ?? content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  Id? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : idValues.map[json["id"]],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : idValues.reverse[id],
        "name": name,
      };
}

enum Id { LA_NACION, INFOBAE, GOOGLE_NEWS }

final idValues =
    EnumValues({"google-news": Id.GOOGLE_NEWS, "infobae": Id.INFOBAE, "la-nacion": Id.LA_NACION});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
