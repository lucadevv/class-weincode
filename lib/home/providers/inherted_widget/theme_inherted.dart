import 'package:flutter/material.dart';

class ThemeInherted extends InheritedWidget {
  const ThemeInherted({
    super.key,
    required super.child,
    required this.changedTheme,
    required this.isDark,
  });
  final ValueChanged<bool> changedTheme;
  final bool isDark;

  static ThemeInherted? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInherted>();
  }

  @override
  bool updateShouldNotify(ThemeInherted oldWidget) {
    return oldWidget.changedTheme != changedTheme || oldWidget.isDark != isDark;
  }
}
