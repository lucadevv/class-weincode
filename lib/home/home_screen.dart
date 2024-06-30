import 'package:curso_weincode/home/providers/inherted_widget/navigate_medium_provide.dart';
import 'package:curso_weincode/home/widgets/appbar_widget.dart';
import 'package:curso_weincode/home/widgets/list_card_widget.dart';
import 'package:curso_weincode/home/widgets/medium_home_widget.dart';
import 'package:curso_weincode/home/widgets/top_home_widget.dart';
import 'package:curso_weincode/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> changedTheme;
  const HomeScreen({
    super.key,
    required this.nameStore,
    required this.changedTheme,
    required this.isDarkTheme,
  });
  final String nameStore;
  final bool isDarkTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int page = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final textTheme = Theme.of(context).textTheme;

    return NavigateMediumProvider(
      pageController: _pageController,
      page: page,
      changePage: (int value) {
        setState(() {
          page = value;
        });
      },
      child: Scaffold(
        backgroundColor: AppColors.brandLightColor,
        appBar: AppbarWidget(
          nameStore: widget.nameStore,
          changedTheme: widget.changedTheme,
          isDarkTheme: widget.isDarkTheme,
        ),
        body: Column(
          children: [
            const TopHomeWidget(),
            MediumHomeWidget(
              pageController: _pageController,
            ),
            ListCardWidget(
              pageController: _pageController,
            ),
          ],
        ),
      ),
    );
  }
}
