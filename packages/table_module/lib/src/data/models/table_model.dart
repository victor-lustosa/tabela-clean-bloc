
import '../../domain/entities/table_entity.dart';

class TableModel extends TableEntity {
  TableModel(
      {required super.year,
      required super.month,
      required super.position,
      required super.numberOfOccupied,
      required super.numberOfVacancies,
      required super.totalVacancies,
      required super.entrancia,
      required super.speciality});

  static List<TableEntity> fromMapList(dynamic data) {
    List<TableEntity> entities = [];
    for (int i = 0; i< 5; i++) {
      entities.add(
          TableModel(
            year: data[i]['year'],
            month: data[i]['month'],
            position: data[i]['position'],
            numberOfOccupied: data[i]['number_of_occupied'],
            numberOfVacancies: data[i]['number_of_vacancies'],
            entrancia: data[i]['entrancia'],
            speciality: data[i]['speciality'],
            totalVacancies: data[i]['total_vacancies'],
          ),
      );
    }
    return entities;
  }
}
