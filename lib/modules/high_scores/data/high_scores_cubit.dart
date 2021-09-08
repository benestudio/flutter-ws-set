import 'package:bloc/bloc.dart';
import 'package:f_set/models/score.dart';
import 'package:f_set/services/api_service.dart';
import 'package:f_set/services/network_error.dart';
import 'package:f_set/utils/fetchable_resource.dart';

class HighScoresCubit extends Cubit<FetchableResource<List<Score>, NetworkError>> {
  HighScoresCubit({required this.apiService}) : super(const FetchableResource.unavailable());

  final ApiService apiService;

  Future fetchHighScores() async {
    emit(const FetchableResource.fetching());
    final highScores = await apiService.getHighScores();
    highScores.fold(
      (error) {
        emit(FetchableResource.error(error));
      },
      (highScores) {
        emit(FetchableResource.available(highScores));
      },
    );
  }
}
