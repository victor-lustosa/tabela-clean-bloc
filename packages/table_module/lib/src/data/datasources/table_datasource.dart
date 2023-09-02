
import 'package:dio/dio.dart';

class TableDatasource {
  final Dio dio = Dio();

    Future<dynamic> getTables(String url) async {
    var result = await dio.get(url);
    if (result.statusCode == 200) {
      return result.data;
    } else {
      throw Exception();
    }
  }
}