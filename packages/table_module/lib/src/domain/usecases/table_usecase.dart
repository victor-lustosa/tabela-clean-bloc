
import '../entities/table_entity.dart';
import '../repositories/table_repository.dart';

class TableUsecase{
  final ITableRepository repository;

  TableUsecase({required this.repository});

  Future<Stream<List<TableEntity>>> getEntities() async{
    List<TableEntity> entities = await repository.get("http://api.npoint.io/fac5d9952672f587e1c1");
    return Stream.value(entities);
  }

  getFilterByYear(){
    //aqui tu passa com o ano e chama la no bloc com um evento de filter
    repository.get("api.npoint.io/fac5d9952672f587e1c1");
  }
}