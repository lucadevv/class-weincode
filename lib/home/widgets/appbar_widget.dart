import 'package:curso_weincode/home/providers/inherted_widget/theme_inherted.dart';
import 'package:curso_weincode/home/widgets/container_icon.dart';
import 'package:curso_weincode/shared/theme/app_colors.dart';
import 'package:curso_weincode/shared/theme/app_radius.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
    required this.nameStore,
    required this.changedTheme,
    required this.isDarkTheme,
  });
  final String nameStore;
  final ValueChanged<bool> changedTheme;
  final bool isDarkTheme;

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
  @override
  Size get preferredSize => const Size.fromHeight(87);
}

class _AppbarWidgetState extends State<AppbarWidget> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    final themeInherted = ThemeInherted.of(context);
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: AppColors.brandLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: AppRadius.xsRadius,
          bottomRight: AppRadius.xsRadius,
        ),
      ),
      toolbarHeight: 97,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/images/profile1.jpeg'),
                ),
              ),
            ),
            Text(
              '${widget.nameStore} Store',
              style: textTheme.headlineLarge,
            ),
            const Spacer(),
            ContainerIcon(
              iconButton: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: AppColors.brandPrimaryColor,
                ),
              ),
            ),
            ContainerIcon(
              margin: const EdgeInsets.only(left: 12),
              iconButton: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.brandPrimaryColor,
                ),
              ),
            ),
            Switch(
              value: themeInherted!.isDark,
              onChanged: themeInherted.changedTheme,
              // onChanged: (value) {
              //   setState(() {
              //     isDark = value;
              //   });
              //   ThemeInherted.of(context)!.changedTheme(isDark);
              // },
            )
          ],
        ),
      ),
    );
  }
}
