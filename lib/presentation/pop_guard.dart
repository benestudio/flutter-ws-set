import 'package:f_set/presentation/animated_simple_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopGuard extends StatelessWidget {
  const PopGuard({Key? key, required this.child, required this.dialog}) : super(key: key);

  final Widget child;
  final Widget dialog;

  @override
  Widget build(BuildContext context) {
    Future<bool> popGuardDialog() async {
      final shouldPop = await showAnimatedDialog<bool>(
        context: context,
        builder: (context) => dialog,
      );

      if (shouldPop == null) {
        return false;
      } else {
        return shouldPop;
      }
    }

    return WillPopScope(
      onWillPop: () => popGuardDialog(),
      child: child,
    );
  }
}

Future<T?> showAnimatedDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Duration duration = const Duration(seconds: 1),
}) {
  return showDialog<T?>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: barrierDismissible,
    builder: (dialogContext) {
      return WillPopScope(
        onWillPop: () async => barrierDismissible,
        child: AnimatedSimpleDialog(
          duration: duration,
          child: builder(dialogContext),
        ),
      );
    },
  );
}
