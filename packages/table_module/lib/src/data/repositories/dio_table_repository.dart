import 'package:table_module/src/data/datasources/table_datasource.dart';
import 'package:table_module/src/domain/repositories/table_repository.dart';

import '../../domain/entities/table_entity.dart';
import '../models/collection_model.dart';

class DioTableRepository implements ITableRepository{

  final TableDatasource datasource;

  DioTableRepository({required this.datasource});

  @override
  Future<List<TableEntity>> get(String url) async{
    var result = await datasource.getTables(url);
    return CollectionModel.fromMap(result);
  }

  @override
  Future getByYear(String url, int year) {
    return datasource.getTables(url);
  }
}