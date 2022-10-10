import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/errors/errors.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/result_search.dart';
import 'package:learningcleararchdart/modules/search/infra/datasources/search_datasource.dart';
import 'package:learningcleararchdart/modules/search/infra/models/result_search_model.dart';
import 'package:learningcleararchdart/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

void main() {
  final datasource = SearchDatasourceMock();

  final repository = SearchRepositoryImpl(datasource);
  test('deve retornar uma lista de ResultSearch', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search('davi');
    expect(result! | null, isA<List<ResultSearch>>());
  });
  test('deve retornar um erro se o datasource falhar', () async {
    when(datasource.getSearch(any))
        .thenThrow(Exception()); // retorna um erro do tipo FailureSearch

    final result = await repository.search('davi');
    expect(result!.fold(id, id), isA<DataSourceError>());
  });
}
