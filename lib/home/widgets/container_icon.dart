import 'package:curso_weincode/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({
    super.key,
    required this.iconButton,
    this.margin,
  });
  final IconButton iconButton;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.brandSecondaryColor,
        ),
      ),
      child: iconButton,
    );
  }
}
