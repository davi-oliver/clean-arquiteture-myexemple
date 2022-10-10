// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:learningcleararchdart/modules/search/domain/entities/errors/errors.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/result_search.dart';
import 'package:learningcleararchdart/modules/search/domain/repositories/search_repository.dart';
import 'package:learningcleararchdart/modules/search/infra/datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  // vai receber um datasource/ chamada externa
  final SearchDatasource datasource;
  SearchRepositoryImpl(
    this.datasource,
  );

  @override
  Future<Either<FailureSearch, List<ResultSearch>?>>? search(
      String? searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
