// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../modules/game/game_screen.dart' as _i5;
import '../../modules/high_scores/high_scores_screen.dart' as _i6;
import '../../modules/instructions/instructions_screen.dart' as _i4;
import '../screens/menu_screen.dart' as _i3;

class AppAutoRouter extends _i1.RootStackRouter {
  AppAutoRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MenuRoute.name: (routeData) => _i1.CustomPage<void>(
        routeData: routeData,
        builder: (_) {
          return const _i3.MenuScreen();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false),
    InstructionsRoute.name: (routeData) => _i1.CustomPage<void>(
        routeData: routeData,
        builder: (_) {
          return const _i4.InstructionsScreen();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false),
    GameRoute.name: (routeData) => _i1.CustomPage<void>(
        routeData: routeData,
        builder: (_) {
          return const _i5.GameScreen();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false),
    HighScoresRoute.name: (routeData) => _i1.CustomPage<void>(
        routeData: routeData,
        builder: (_) {
          return const _i6.HighScoresScreen();
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MenuRoute.name, path: '/'),
        _i1.RouteConfig(InstructionsRoute.name, path: '/instructions-screen'),
        _i1.RouteConfig(GameRoute.name, path: '/game-screen'),
        _i1.RouteConfig(HighScoresRoute.name, path: '/high-scores-screen')
      ];
}

class MenuRoute extends _i1.PageRouteInfo {
  const MenuRoute() : super(name, path: '/');

  static const String name = 'MenuRoute';
}

class InstructionsRoute extends _i1.PageRouteInfo {
  const InstructionsRoute() : super(name, path: '/instructions-screen');

  static const String name = 'InstructionsRoute';
}

class GameRoute extends _i1.PageRouteInfo {
  const GameRoute() : super(name, path: '/game-screen');

  static const String name = 'GameRoute';
}

class HighScoresRoute extends _i1.PageRouteInfo {
  const HighScoresRoute() : super(name, path: '/high-scores-screen');

  static const String name = 'HighScoresRoute';
}
