import 'package:f_set/data/global_scope_dependencies.dart';
import 'package:f_set/presentation/routing/app_auto_router.gr.dart';
import 'package:f_set/presentation/theme/app_theme.dart';
import 'package:f_set/presentation/theme/scale.dart';
import 'package:f_set/utils/ignore_text_scale.dart';
import 'package:f_set/utils/non_glowing_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(App());
}

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _appAutoRouter = useState(AppAutoRouter()).value;

    return GlobalScopeDependencies(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appAutoRouter.delegate(),
        routeInformationParser: _appAutoRouter.defaultRouteParser(),
        builder: (context, navigator) => AppConfigurations(child: navigator!),
      ),
    );
  }
}

class AppConfigurations extends StatelessWidget {
  const AppConfigurations({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Scale.setup(
      screenSize: MediaQuery.of(context).size,
      designSize: const Size(375, 812),
    );

    return AppTheme(
      brightness: MediaQuery.of(context).platformBrightness,
      child: Builder(
        builder: (context) {
          return Theme(
            data: AppTheme.of(context).theme,
            child: IgnoreTextScale(
              child: ScrollConfiguration(
                behavior: const NonGlowingScrollBehavior(),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
