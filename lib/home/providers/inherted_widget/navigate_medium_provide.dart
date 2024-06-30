import 'package:flutter/material.dart';

class NavigateMediumProvider extends InheritedWidget {
  final PageController pageController;
  final int page;
  final ValueChanged<int> changePage;
  const NavigateMediumProvider({
    super.key,
    required super.child,
    required this.pageController,
    required this.page,
    required this.changePage,
  });

  static NavigateMediumProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NavigateMediumProvider>();
  }

  @override
  bool updateShouldNotify(NavigateMediumProvider oldWidget) {
    return oldWidget.pageController != pageController ||
        oldWidget.page != page ||
        oldWidget.changePage != changePage;
  }
}
