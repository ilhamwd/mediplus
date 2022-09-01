import 'package:mediplus/system/classes/repository.dart';
import 'package:mediplus/system/enum/request_method.dart';
import 'package:mediplus/system/models/news.dart';

class NewsRepository extends Repository {
  NewsRepository(super.api);

  Future<News> getNews(Map<String, dynamic> params) => api.request<News>(
      endpoint: "everything",
      model: News(),
      params: params,
      method: RequestMethod.get);
}
