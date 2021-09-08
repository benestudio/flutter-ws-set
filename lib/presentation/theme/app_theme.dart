import 'dart:ui';
import 'package:f_set/presentation/theme/scale.dart';
import 'package:f_set/set.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final screenInset = EdgeInsets.only(bottom: 32.hs, left: 45.hs, right: 45.hs);
const entryDuration = Duration(milliseconds: 300);
const entryDelay = Duration(milliseconds: 300);

class AppTheme extends InheritedWidget {
  const AppTheme({
    Key? key,
    required Widget child,
    required this.brightness,
  }) : super(key: key, child: child);
  final Brightness brightness;

  @override
  bool updateShouldNotify(AppTheme oldWidget) => true;

  static AppTheme of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppTheme>()!;

  static const Map<ColorType, Color> cardColorMap = {
    ColorType.blue: AppTheme.blue,
    ColorType.green: AppTheme.green,
    ColorType.yellow: AppTheme.yellow,
  };

  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const ivory = Color(0xFFFFF7F6);

  static const blue = Color(0xFF293253);
  static const green = Color(0xFF6DD47E);
  static const yellow = Color(0xFFFFD55A);

  static const gray1 = Color(0xFF7F7F7F);
  static const gray2 = Color(0xFFA6A6A6);
  static const gray3 = Color(0xFFE3E3E3);
  static const gray = gray1;

  static const gradient = LinearGradient(
    colors: [Color(0xFFDB4032), Color(0xFFE47738)],
  );

  bool get isDark => brightness == Brightness.dark;

  Color get primary => isDark ? black : white;
  Color get onPrimary => isDark ? white : black;
  Color get elevatedPrimary => blue;
  Color get onElevatedPrimary => white;

  Color get secondary => isDark ? gray1 : white;
  Color get onSecondary => isDark ? white : gray1;

  ColorScheme get colorScheme => isDark ? _darkColorScheme : _lightColorScheme;
  Color get appBarBackground => isDark ? Colors.grey.shade800 : Colors.white;
  Color get appBackground => isDark ? Colors.grey.shade700 : AppTheme.white;
  Color get cardBackgroundColor => isDark ? Colors.grey.shade700 : AppTheme.white;
  Color get cardBorderColor => isDark ? Colors.grey.shade200 : Colors.black;
  Color get cardSilhouetteBorderColor => isDark ? Colors.grey.shade200 : Colors.grey.shade300;

  ThemeData get theme => ThemeData.from(
        colorScheme: colorScheme,
      ).copyWith(
        textButtonTheme: textButtonThemeData,
        outlinedButtonTheme: outlinedButtonThemeData,
        elevatedButtonTheme: elevatedButtonThemeData,
        appBarTheme: AppBarTheme(
          color: appBarBackground,
          foregroundColor: onPrimary,
          // systemOverlayStyle: systemOverlayStyle,
        ),
        scaffoldBackgroundColor: appBackground,
        backgroundColor: appBackground,
        iconTheme: IconThemeData(color: onPrimary),
        chipTheme: ChipThemeData.fromDefaults(
          primaryColor: black,
          secondaryColor: blue,
          labelStyle: body,
        ).copyWith(
          backgroundColor: secondary,
        ),
      );

  TextStyle get h1 => GoogleFonts.merriweather(fontSize: 90.hs, height: 1.3, fontWeight: FontWeight.w700);
  TextStyle get h2 => GoogleFonts.merriweather(fontSize: 36.hs, height: 1.3, fontWeight: FontWeight.w700);
  TextStyle get h3 => GoogleFonts.merriweather(fontSize: 28.hs, height: 1.3);
  TextStyle get body => GoogleFonts.merriweather(
        fontSize: 16.hs,
        height: 1.4,
      );
  TextStyle get bodyMono => GoogleFonts.sourceCodePro(
        fontSize: 12.hs,
        height: 1.4,
        fontWeight: FontWeight.w500,
        fontFeatures: [const FontFeature.tabularFigures()],
      );

  Color get dividerBackgroundColor => isDark ? white : gray1;
  Color get disabledColor => isDark ? gray1 : gray3;

  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: elevatedPrimary,
          elevation: 0,
          enableFeedback: false,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.hs)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          animationDuration: const Duration(milliseconds: 70),
          padding: largeButtonPadding,
        ).copyWith(
          textStyle: buttonTextStyle,
        ),
      );

  OutlinedButtonThemeData get outlinedButtonThemeData => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: blue,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.hs)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: largeButtonPadding,
          backgroundColor: secondary,
        ).copyWith(
          textStyle: buttonTextStyle,
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (states) => BorderSide(width: 0.5.hs, color: states.contains(MaterialState.disabled) ? gray2 : blue),
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => states.contains(MaterialState.disabled) ? gray1 : onPrimary,
          ),
        ),
      );

  ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: elevatedPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.hs)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: largeButtonPadding,
        ).copyWith(
          elevation: MaterialStateProperty.all<double>(0),
          textStyle: buttonTextStyle,
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => states.contains(MaterialState.disabled) ? gray3 : elevatedPrimary,
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => states.contains(MaterialState.disabled) ? gray1 : onElevatedPrimary,
          ),
        ),
      );

  ButtonStyle getSmallerOutlinedButtonStyle({Color color = AppTheme.blue}) {
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(color.withOpacity(0.15)),
      padding: MaterialStateProperty.all(
        largeButtonPadding.copyWith(top: 11.hs, bottom: 11.hs),
      ),
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (states) => BorderSide(
          width: 2.hs,
          color: states.contains(MaterialState.disabled) ? AppTheme.gray1 : color,
        ),
      ),
    );
  }

  ButtonStyle get largePaddingButtonStyle => ButtonStyle(
        padding: MaterialStateProperty.all(largeButtonPadding),
      );

  EdgeInsets get largeButtonPadding => EdgeInsets.symmetric(horizontal: 22.hs, vertical: 17.hs);

  MaterialStateProperty<TextStyle> get buttonTextStyle => MaterialStateProperty.all<TextStyle>(body);
}

final _lightColorScheme = ColorScheme.fromSwatch(
  // ignore: avoid_redundant_argument_values
  brightness: Brightness.light,
  primarySwatch: createMaterialColor(Colors.blue),
  accentColor: Colors.red,
);

final _darkColorScheme = ColorScheme.fromSwatch(
  brightness: Brightness.dark,
  primarySwatch: createMaterialColor(Colors.indigo),
  accentColor: Colors.pink,
  cardColor: Colors.grey.shade700,
).copyWith();

MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = [.05];
  final Map<int, Color> swatch = {};
  final r = color.red;
  final g = color.green;
  final b = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (final strength in strengths) {
    final ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

Color createColorFromHex(String hexColor) {
  final colorCode = hexColor.toUpperCase().replaceAll("#", "");
  return Color(int.parse('FF$colorCode', radix: 16));
}
