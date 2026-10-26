// Floating white navigation capsule and active icon styling.


import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BottomNavPill extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavPill({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  static const List<IconData> navIcons = [
    Icons.home_filled,
    Icons.map,
    Icons.calendar_month,
    Icons.grid_view_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 245,
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(navIcons.length, (index) {
          final isSelected = selectedIndex == index;

          return InkWell(
            borderRadius: BorderRadius.circular(13),
            onTap: () => onTap(index),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.yellow
                    : AppColors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                navIcons[index],
                size: 23,
                color: AppColors.background,
              ),
            ),
          );
        }),
      ),
    );
  }
}
