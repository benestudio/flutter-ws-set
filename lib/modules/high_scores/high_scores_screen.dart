import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:f_set/utils/extensions.dart';

class HighScoresScreen extends HookWidget {
  const HighScoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('high_scores_screen')),
      body: const Center(
        child: Text(''),
      ),
    );
  }
}
