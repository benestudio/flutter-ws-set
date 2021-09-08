import 'package:f_set/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'type_scale.freezed.dart';

@freezed
class TypeScaleType with _$TypeScaleType {
  const TypeScaleType._();
  const factory TypeScaleType.h1() = TypeScaleTypeH1;
  const factory TypeScaleType.h2() = TypeScaleTypeH2;
  const factory TypeScaleType.h3() = TypeScaleTypeH3;
  const factory TypeScaleType.body() = TypeScaleTypeBody;
  const factory TypeScaleType.bodyMono() = TypeScaleTypeBodyMono;
}

class TypeScale extends StatelessWidget {
  const TypeScale.h1(this.child, {Key? key, this.type = const TypeScaleType.h1()}) : super(key: key);
  const TypeScale.h2(this.child, {Key? key, this.type = const TypeScaleType.h2()}) : super(key: key);
  const TypeScale.h3(this.child, {Key? key, this.type = const TypeScaleType.h3()}) : super(key: key);
  const TypeScale.body(this.child, {Key? key, this.type = const TypeScaleType.body()}) : super(key: key);
  const TypeScale.bodyMono(this.child, {Key? key, this.type = const TypeScaleType.bodyMono()}) : super(key: key);


  final Widget child;
  final TypeScaleType type;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = type.when(
      h1: () => AppTheme.of(context).h1,
      h2: () => AppTheme.of(context).h2,
      h3: () => AppTheme.of(context).h3,
      body: () => AppTheme.of(context).body,
      bodyMono: () => AppTheme.of(context).bodyMono,
    );
    return DefaultTextStyle.merge(style: style, child: child);
  }
}
