// Reusable colored or white service tile, with a tappable area.


import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ServiceTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final bool showTitle;
  final VoidCallback onTap;

  const ServiceTile({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 92,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: AppColors.black,
                ),
                if (showTitle) ...[  // conditional rendering
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
