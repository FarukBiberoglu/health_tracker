import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:penta_core/penta_core.dart';

class CustomBottomNavBarData {
  CustomBottomNavBarData({
    required this.page,
    required this.icon,
    required this.label,
  });

  final Widget page;
  final IconData icon;
  final String label;
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    required this.selectedIndex,
    required this.onTap,
    required this.data,
    super.key,
  });

  final int selectedIndex;
  final void Function(int index) onTap;
  final List<CustomBottomNavBarData> data;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final padding = screenHeight * 0.01;

    return Observer(
      builder:
          (_) => Container(
            height: 85,
            decoration: BoxDecoration(
              color: context.appThemeExt.appColors.background.byBrightness(
                context.ext.theme.isDark,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: padding,
                horizontal: padding * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(data.length, (index) {
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () => onTap(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? context.appThemeExt.appColors.primary
                                    .withValues(alpha: 0.2)
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            data[index].icon,
                            color:
                                isSelected
                                    ? context.appThemeExt.appColors.primary
                                    : context.appThemeExt.appColors.grey,
                            size: 28,
                          ),
                          if (isSelected) const SizedBox(width: 6),
                          if (isSelected)
                            Text(
                              data[index].label,
                              style: context.ext.theme.textTheme.bodyMedium
                                  ?.copyWith(
                                    color:
                                        isSelected
                                            ? context
                                                .appThemeExt
                                                .appColors
                                                .primary
                                            : context
                                                .appThemeExt
                                                .appColors
                                                .grey,
                                  ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
    );
  }
}
