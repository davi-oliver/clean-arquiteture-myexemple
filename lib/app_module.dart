import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learningcleararchdart/app_widget.dart';
import 'package:learningcleararchdart/modules/search/domain/entities/usecases/search_by_text.dart';
import 'package:learningcleararchdart/modules/search/external/github_datasource.dart';
import 'package:learningcleararchdart/modules/search/infra/repositories/search_repository_impl.dart';

import 'modules/search/presenter/search/search_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SearchByTextImpl(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => Dio()),
        Bind((i) => GitHubDatasource(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SearchPage(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
