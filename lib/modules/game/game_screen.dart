import 'package:f_set/modules/game/data/game_cubit.dart';
import 'package:f_set/modules/game/set_board.dart';
import 'package:f_set/presentation/pop_guard.dart';
import 'package:f_set/presentation/theme/scale.dart';
import 'package:f_set/utils/type_scale.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f_set/presentation/routing/app_auto_router.gr.dart';

class GameScreen extends HookWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<GameCubit>().initializeGame();
    }, []);

    return BlocListener<GameCubit, GameCubitState>(
      listenWhen: (_, state) => state.setsOnBoard.isEmpty && state.deck.isEmpty,
      listener: (context, state) async => showAnimatedDialog<void>(
        context: context,
        builder: (context) => const GameFinishedDialog(),
        barrierDismissible: false,
      ),
      child: const PopGuard(
        dialog: ExitGameConfirmationDialog(),
        child: Scaffold(
          body: SafeArea(
            child: SetBoard(),
          ),
        ),
      ),
    );
  }
}

class ExitGameConfirmationDialog extends StatelessWidget {
  const ExitGameConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TypeScale.body(Text(
          'Do you want to finish this game?',
          textAlign: TextAlign.center,
        )),
        SizedBox(height: 24.hs),
        ElevatedButton(
          onPressed: () => context.router.pop(false),
          child: const Text('Continue playing'),
        ),
        SizedBox(height: 12.hs),
        OutlinedButton(
          onPressed: () => context.router.pop(true),
          child: const Text('Exit'),
        ),
      ],
    );
  }
}

class GameFinishedDialog extends StatelessWidget {
  const GameFinishedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 12.hs),
        const TypeScale.body(Text(
          'Congrats! 🎉🎉🎉',
          textAlign: TextAlign.center,
        )),
        SizedBox(height: 24.hs),
        ElevatedButton(
          onPressed: () async {
            context.read<GameCubit>().initializeGame();
            await Future<void>.delayed(const Duration(milliseconds: 100));
            context.router.popForced();
          },
          child: const Text('Replay'),
        ),
        SizedBox(height: 12.hs),
        OutlinedButton(
          onPressed: () async {
            await context.router.pop();
            context.router.navigate(const MenuRoute());
          },
          child: const Text('Exit to menu'),
        ),
      ],
    );
  }
}
