import 'package:dio/dio.dart';
import 'package:mytest/model/searchModel.dart';
import '../routes.dart';

class SearchRepository {
  Future<SearchModel> repos(
    String _id,
  ) async {
    var url = Routes.APIURL;

    print('Поиск информации ...');

    Response response = await Dio().get(
      url,
      queryParameters: {
        "q": _id,
        "per_page": "100",
      },
    );

    if (response.statusCode == 200) {
      print('Repository успешно найден!');
      return SearchModel.fromJson(response.data);
    } else {
      print('Repository не найден!');
      return null;
    }
  }
}
