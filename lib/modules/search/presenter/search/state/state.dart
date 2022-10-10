// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learningcleararchdart/modules/search/domain/entities/errors/errors.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/result_search.dart';

abstract class SearchState {}

class SearchSucess implements SearchState {
  List<ResultSearch>? list;
  SearchSucess(
    this.list,
  );
}

class SearchStart implements SearchState {}

class SearchLoading implements SearchState {}

class SearchError implements SearchState {
  FailureSearch? err;
  SearchError(
    this.err,
  );
}
