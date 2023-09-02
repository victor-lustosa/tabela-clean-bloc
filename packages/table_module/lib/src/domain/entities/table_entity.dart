class TableEntity {

  final int year;
  final int month;
  final String position;
  final int numberOfOccupied;
  final int numberOfVacancies;
  final int totalVacancies;
  final String entrancia;
  final String speciality;

  TableEntity(
      {required this.year,
        required this.month,
        required this.position,
        required this.numberOfOccupied,
        required this.numberOfVacancies,
        required this.totalVacancies,
        required this.entrancia,
        required this.speciality});
}
