import '../entities/table_entity.dart';

abstract class ITableRepository{
  Future<List<TableEntity>> get(String url);
  Future getByYear(String url, int year);
}