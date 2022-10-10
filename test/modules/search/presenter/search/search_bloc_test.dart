import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/result_search.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/usecases/search_by_text.dart';
import 'package:learningcleararchdart/modules/search/presenter/search/search_bloc.dart';
import 'package:learningcleararchdart/modules/search/presenter/search/state/state.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  final usercase = SearchByTextMock();
  final bloc = SearchBloc(usercase);
  test('deve retornar os estados na ordem correta ', () {
    when(usercase(any)).thenAnswer((_) async => Right(<ResultSearch>[]));
    expect(bloc, emitsInOrder([isA<SearchLoading>(), isA<SearchSucess>()]));
    bloc.add('davizr');
  });
}
