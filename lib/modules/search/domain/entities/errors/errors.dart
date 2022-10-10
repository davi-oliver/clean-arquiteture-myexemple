// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {}

class DataSourceError implements FailureSearch {
  final String? messege;
  DataSourceError({
    this.messege,
  });
}
