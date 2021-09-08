import 'package:dartz/dartz.dart';
import 'package:f_set/models/score.dart';
import 'package:f_set/services/api_client.dart';
import 'package:f_set/services/network_error.dart';

class ApiService {
  ApiService(this.api);

  final ApiClient api;

  Future<Either<NetworkError, List<Score>>> getHighScores() async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 1500));
      final highscores = await api.getHighScores();
      return Right(highscores);
    } on Exception catch (e) {
      return Left(NetworkError(message: e.toString()));
    }
  }
}
