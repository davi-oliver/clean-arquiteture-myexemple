// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';

import 'package:learningcleararchdart/modules/search/domain/entities/errors/errors.dart';
import 'package:learningcleararchdart/modules/search/infra/datasources/search_datasource.dart';
import 'package:learningcleararchdart/modules/search/infra/models/result_search_model.dart';

extension on String {
  normalize() {
    return this.replaceAll(' ', '+');
  }
}

class GitHubDatasource implements SearchDatasource {
  final Dio dio;
  GitHubDatasource(
    this.dio,
  );

  @override
  Future<List<ResultSearchModel>>? getSearch(String? searchText) async {
    final response = await dio.get(
        'https://api.github.com/search/users?q=${searchText!.normalize()}');
    var list;
    if (response.statusCode == 200) {
      list = (response.data['items'] as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();
      return list;
    } else {
      return throw DataSourceError();
    }
  }
}
