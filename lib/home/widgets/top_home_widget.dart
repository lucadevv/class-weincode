import 'package:curso_weincode/home/widgets/container_icon.dart';
import 'package:curso_weincode/home/widgets/custom_money.dart';
import 'package:curso_weincode/shared/theme/app_colors.dart';
import 'package:curso_weincode/shared/theme/app_radius.dart';
import 'package:flutter/material.dart';

class TopHomeWidget extends StatelessWidget {
  const TopHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Transform.translate(
      offset: const Offset(0, -12),
      child: Container(
        height: size.height * 0.4,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.brandPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: AppRadius.xsRadius,
            bottomRight: AppRadius.xsRadius,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Budget',
              style: textTheme.displaySmall!.copyWith(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomMoney(
                amount: 28680000,
                textStyle:
                    textTheme.displayLarge!.copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CardAmountWidget(
                amount: 700000,
                title: 'Incomes',
                button: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_upward,
                    color: AppColors.brandOnSuccessColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CardAmountWidget(
                amount: 700000,
                title: 'Spending',
                button: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: AppColors.brandOnErrorColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardAmountWidget extends StatelessWidget {
  const CardAmountWidget({
    super.key,
    required this.amount,
    required this.title,
    required this.button,
  });

  final double amount;
  final String title;
  final IconButton button;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 80,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.brandSecondaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          TrendWidget(button: button),
          Text(
            title,
            style: textTheme.displaySmall!.copyWith(color: Colors.white),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomMoney(
                  amount: amount,
                  textStyle:
                      textTheme.displayMedium!.copyWith(color: Colors.white),
                ),
                const Text("From January 1 to Juanary 31"),
              ],
            ),
          ),
          ContainerIcon(
            iconButton: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_right),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class TrendWidget extends StatelessWidget {
  const TrendWidget({
    super.key,
    required this.button,
  });

  final IconButton button;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: button,
    );
  }
}
