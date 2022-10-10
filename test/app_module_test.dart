import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningcleararchdart/app_module.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/result_search.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/usecases/search_by_text.dart';
import 'package:learningcleararchdart/modules/search/utils/github_response.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'modules/search/external/github_datasource_test.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = MockDio();
  setUp(() {
    initModule(AppModule(), replaceBinds: [Bind<Dio>((i) => dio)]);
  });
  test('deve recuperar o usecase sem erro', () {
    final usercase = Modular.get<SearchByText>();
    expect(usercase, isA<SearchByTextImpl>());
  });

  test('deve trazer uma lista de ResultSearch', () async {
    when(dio.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(gitResponse), statusCode: 200));
    final usercase = Modular.get<SearchByText>();
    final result = await usercase('davi');

    expect(result | null, isA<List<ResultSearch>>());
  });
}
