import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/errors/errors.dart';
import 'package:learningcleararchdart/modules/search/external/github_datasource.dart';
import 'package:learningcleararchdart/modules/search/utils/github_response.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final dio = MockDio();
  final datasouce = GitHubDatasource(dio);
  test("deve retornar uma lista de ResultModel", () {
    when(dio.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(gitResponse), statusCode: 200));
    final result = datasouce.getSearch('searchText');
    expect(result, completes);
  });
  test("deve retornar uma exception se status code diferente 200", () {
    when(dio.get(any)).thenThrow(DataSourceError());
    final result = datasouce.getSearch('searchText');
    expect(result, throwsA(isA<DataSourceError>()));
  });
}
