// Reusable route row with gate, date, and divider.


import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DepartureItem extends StatelessWidget {
  final String route;
  final String gate;
  final String dateTime;
  final VoidCallback onTap;

  const DepartureItem({
    super.key,
    required this.route,
    required this.gate,
    required this.dateTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    route,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  gate,
                  style: const TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              dateTime,
              style: const TextStyle(
                color: AppColors.secondaryText,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.divider,
            ),
          ],
        ),
      ),
    );
  }
}
