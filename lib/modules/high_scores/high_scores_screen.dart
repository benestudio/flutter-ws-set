import 'package:f_set/modules/high_scores/data/high_scores_cubit.dart';
import 'package:f_set/presentation/hero.dart';
import 'package:f_set/presentation/scroll_extent_builder.dart';
import 'package:f_set/presentation/theme/scale.dart';
import 'package:f_set/utils/type_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:f_set/utils/extensions.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HighScoresScreen extends HookWidget {
  const HighScoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final highScores = context.select((HighScoresCubit cubit) => cubit.state);

    useEffect(() {
      context.read<HighScoresCubit>().fetchHighScores();
    }, []);

    return ScrollExtentBuilder(
      builder: (context, scrollController, isOnTop, isOnBottom) {
        return Scaffold(
          appBar: AppBar(
            title: const MaterialHero(
              tag: 'yes',
              child: TypeScale.h3(Text('High scores'),),
            ),
            backwardsCompatibility: false,
            elevation: isOnTop ? 0 : 4,
          ),
          body: highScores.when(
            unavailable: () => const SizedBox(),
            fetching: (oldValue) => const Center(child: CircularProgressIndicator()),
            available: (highScores) {
              return AnimationLimiter(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  padding: EdgeInsets.symmetric(horizontal: 16.hs),
                  controller: scrollController,
                  itemCount: highScores.length,
                  itemBuilder: (context, index) {
                    final score = highScores[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: FadeInAnimation(
                        child: SizedBox(
                          height: 100.hs,
                          child: ListTile(
                            title: Text(score.username),
                            subtitle: Text(score.time.formatDurationSimple()),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            error: (error) => Text(error?.message ?? 'Oops'),
          ),
        );
      },
    );
  }
}
