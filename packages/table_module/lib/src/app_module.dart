import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/table_datasource.dart';
import 'data/repositories/dio_table_repository.dart';
import 'domain/repositories/table_repository.dart';
import 'domain/usecases/table_usecase.dart';
import 'ui/reactivity/table_bloc.dart';
import 'ui/views/table_view.dart';

class TableModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton(TableDatasource.new);
    i.addSingleton<ITableRepository>(DioTableRepository.new);
    i.addSingleton(TableUsecase.new);
    i.addSingleton<TableBloc>(
      TableBloc.new,
      config: BindConfig(
        onDispose: (bloc) => bloc.close(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const TableListView());
  }
}
