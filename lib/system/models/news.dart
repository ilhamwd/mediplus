// Multiple items model
import 'package:mediplus/system/classes/model.dart';

// Plural news
class AllNews extends Model {
  late final List<News> news;

  @override
  void fromJson(Map<String, dynamic> data) {
    final List<dynamic> rawNews = data['articles'];

    news = rawNews.map((news) => News()..fromJson(news)).toList();
  }
}

// Singular news
class News extends Model {
  late String author, title, description, url, urlToImg, content;
  late DateTime publicationDate;
  late NewsSource source;

  @override
  void fromJson(Map<String, dynamic> data) {
    source = NewsSource()..fromJson(data['source']);
    author = data['author'];
    title = data['title'];
    description = data['description'];
    url = data['url'];
    urlToImg = data['urlToImg'];
    publicationDate = DateTime.parse(data['publishedAt']);
    content = data['content'];
  }
}

class NewsSource extends Model {
  late String? id;
  late String name;

  @override
  void fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
  }
}
