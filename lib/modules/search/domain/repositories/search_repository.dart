import 'package:dartz/dartz.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/errors/errors.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/result_search.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>?>>? search(
      String? searchText);
}
