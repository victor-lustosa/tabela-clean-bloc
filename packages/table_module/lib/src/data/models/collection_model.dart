

import '../../domain/entities/table_entity.dart';
import 'table_model.dart';

class CollectionModel{
 final List<TableEntity> tableEntities;

  CollectionModel({required this.tableEntities});

 static List<TableEntity> fromMap(Map<String, dynamic> map) {
   return TableModel.fromMapList(map['collection']);
 }

}