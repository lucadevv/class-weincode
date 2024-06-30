import 'package:curso_weincode/home/providers/inherted_widget/navigate_medium_provide.dart';
import 'package:curso_weincode/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MediumHomeWidget extends StatelessWidget {
  const MediumHomeWidget({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final pageControllerr = NavigateMediumProvider.of(context);

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 12),
      color: AppColors.brandLightColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(
                  pageControllerr!.page == 0
                      ? AppColors.brandSecondaryColor
                      : AppColors.brandLightColor),
              elevation:
                  WidgetStateProperty.all(pageControllerr.page == 0 ? 1 : 0),
            ),
            onPressed: () {
              pageControllerr.pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
              child: Text(
                'Categories',
                style: pageControllerr.page == 1
                    ? textTheme.bodyMedium!.copyWith(
                        color: AppColors.brandLigthDarkColor,
                      )
                    : textTheme.bodyMedium,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(pageControllerr.page == 0
                  ? AppColors.brandLightColor
                  : AppColors.brandSecondaryColor),
              elevation:
                  WidgetStateProperty.all(pageControllerr.page == 1 ? 1 : 0),
            ),
            onPressed: () {
              pageControllerr.pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
              child: Text(
                'Recent Transaction',
                style: pageControllerr.page == 0
                    ? textTheme.bodyMedium!.copyWith(
                        color: AppColors.brandLigthDarkColor,
                      )
                    : textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
