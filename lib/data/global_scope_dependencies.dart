import 'package:dio/dio.dart';
import 'package:f_set/modules/game/data/game_cubit.dart';
import 'package:f_set/modules/high_scores/data/high_scores_cubit.dart';
import 'package:f_set/services/api_client.dart';
import 'package:f_set/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GlobalScopeDependencies extends HookWidget {
  const GlobalScopeDependencies({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _dio = useState(Dio());
    final _client = useState(ApiClient(_dio.value));
    final _apiService = useState(ApiService(_client.value));

    return MultiBlocProvider(providers: [
      BlocProvider<GameCubit>(
        create: (context) => GameCubit(),
      ),
      BlocProvider<HighScoresCubit>(
        create: (context) => HighScoresCubit(
          apiService: _apiService.value
        ),
      ),
    ], child: child);
  }
}
