import 'package:dio/dio.dart';
import 'package:f_set/models/score.dart';

class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Future<List<Score>> getHighScores() async {
    final response = await _dio.get<List<dynamic>>('https://jsonplaceholder.typicode.com/users');

    if (response.data == null) {
      throw Exception('Response data is null');
    }
    return Score.listFrom(response.data!);
  }
}
