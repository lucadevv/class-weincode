import 'package:curso_weincode/config/routes/app_routes.dart';
import 'package:curso_weincode/home/providers/inherted_widget/navigate_medium_provide.dart';
import 'package:curso_weincode/home/widgets/custom_money.dart';
import 'package:curso_weincode/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ListCardWidget extends StatelessWidget {
  const ListCardWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final pageControllerr = NavigateMediumProvider.of(context);
    return Expanded(
      child: Container(
        color: AppColors.brandSecondaryColor,
        child: Column(
          children: [
            Align(
              alignment: const AlignmentDirectional(1, 0),
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton(
                  onPressed: () {
                    pageControllerr!.page == 0
                        ? Navigator.of(context).pushNamed(AppRoutes.newScreen)
                        : null;
                  },
                  child: Text(
                    'View All',
                    style: textTheme.bodyLarge!.copyWith(
                      color: AppColors.brandPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageControllerr!.pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  pageControllerr.changePage(value);
                },
                children: [
                  CategoriesListWidget(size: size, textTheme: textTheme),
                  Container(
                    color: Colors.red,
                    child: ListView.builder(
                      itemBuilder: (context, index) {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin:
              const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
          decoration: BoxDecoration(
              color: AppColors.brandLightColor,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 60,
                decoration: BoxDecoration(
                  color: AppColors.brandSecondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/${index + 1}.png',
                    scale: 25,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.only(left: 12),
                child: Column(
                  children: [
                    const Text("Food And Drink"),
                    const Spacer(),
                    CustomMoney(
                      amount: 5000,
                      textStyle: textTheme.displayMedium!
                          .copyWith(color: AppColors.brandPrimaryColor),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.topCenter,
                height: 20,
                width: 70,
                decoration: BoxDecoration(
                  color: AppColors.brandSuccessColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColors.brandOnSuccessColor,
                    ),
                    Text(
                      "${(index + 1) * 2.5}%",
                      style: const TextStyle(
                        color: AppColors.brandOnSuccessColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
