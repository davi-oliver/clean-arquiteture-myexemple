import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/errors/errors.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/result_search.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/usecases/search_by_text.dart';
import 'package:learningcleararchdart/modules/search/domain/repositories/search_repository.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final SearchRepositoryMock repository = SearchRepositoryMock();
  final usecases = SearchByTextImpl(repository);

  test("deve retornar uma lista de ResultSearch", () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecases("davi");
    // O Eigther retorna um lado Esquedo ou direito ->
    // Esquerdo -> Excepiton
    // Direito -> O que se espera

    // // getOrElse -> se o que se espera a cima não for right ele volta null | <- representa a mesma coisa

    expect(result | null, isA<List<ResultSearch>>());
  });

  test("deve retornar um exception caso o texto seja invalido", () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecases(null);

    // para retornar a lista -> diretiro || e para retornar exception -> esquerdo
    // getOrElse -> se o que se espera a cima não for right ele volta null | <- representa a mesma coisa
    expect(result.isLeft(),
        true); // to falando que se for do tipo esquerdo é um erro, logo deve retornar a exception
    expect(result.fold(id, id), isA<InvalidTextError>());
    result = await usecases(''); // teste vazio
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
