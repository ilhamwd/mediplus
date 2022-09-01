import 'package:mediplus/system/classes/repository.dart';
import 'package:mediplus/system/enum/request_method.dart';
import 'package:mediplus/system/models/news.dart';

class NewsRepository extends Repository {
  NewsRepository(super.api);

  Future<AllNews> getNews(Map<String, dynamic> params) => api.request<AllNews>(
      endpoint: "everything",
      model: AllNews(),
      params: params,
      method: RequestMethod.get);
}
