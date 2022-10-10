// my implementation
import 'package:dartz/dartz.dart';
import 'package:flutter/gestures.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/errors/errors.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/result_search.dart';
import 'package:learningcleararchdart/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  // define contract for all class what implementation this class
  Future<Either<FailureSearch, List<ResultSearch>?>> call(String? searchText);

  // Eigther -> Força a receber um contrato com tratamento de erros
  // ao inves de usar uma Exception externa pode se criar exception propria do Dominio.
  // fazendo com que a manutenção fique mais facil

}

class SearchByTextImpl implements SearchByText {
  SearchRepository repository;

// isso faz com que qualquer interface que implement o meu searchrepository eu vou receber nesta classe
  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>?>> call(
      String? searchText) async {
    if (searchText == null || searchText == '') {
      return Future.value(Left(InvalidTextError()));
    }
    return repository.search(searchText)!;
  }
}
