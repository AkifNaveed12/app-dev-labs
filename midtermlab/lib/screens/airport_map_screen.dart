// Main screen, header, service grid, departures, bottom navigation, and selected-tab state.


import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/service_tile.dart';
import '../widgets/departure_item.dart';
import '../widgets/bottom_nav_pill.dart';

class AirportMapScreen extends StatefulWidget {
  const AirportMapScreen({super.key});

  @override
  State<AirportMapScreen> createState() => _AirportMapScreenState();
}

class _AirportMapScreenState extends State<AirportMapScreen> {
  int selectedIndex = 0;

  void handleServiceTap(String service) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$service tapped'),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  Widget buildServiceRow({
    required String leftTitle,
    required IconData leftIcon,
    required Color leftColor,
    required String rightTitle,
    required IconData rightIcon,
    required Color rightColor,
    required bool leftShowTitle,
    required bool rightShowTitle,
    required int leftFlex,
    required int rightFlex,
  }) {
    return Row(
      children: [
        Expanded(
          flex: leftFlex,
          child: ServiceTile(
            title: leftTitle,
            icon: leftIcon,
            color: leftColor,
            showTitle: leftShowTitle,
            onTap: () => handleServiceTap(leftTitle),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: rightFlex,
          child: ServiceTile(
            title: rightTitle,
            icon: rightIcon,
            color: rightColor,
            showTitle: rightShowTitle,
            onTap: () => handleServiceTap(rightTitle),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 20, 22, 90),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good afternoon!',
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Airport map',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 31,
                                  fontWeight: FontWeight.w700,
                                  height: 1.15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              handleServiceTap('Quick action'),
                          icon: const Icon(
                            Icons.north_east,
                            size: 30,
                            color: AppColors.yellow,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Service row 1: Transfer + Hotel
                    buildServiceRow(
                      leftTitle: 'Transfer',
                      leftIcon: Icons.local_taxi,
                      leftColor: AppColors.yellow,
                      rightTitle: 'Hotel',
                      rightIcon: Icons.bed,
                      rightColor: AppColors.white,
                      leftShowTitle: true,
                      rightShowTitle: false,
                      leftFlex: 3,
                      rightFlex: 2,
                    ),

                    const SizedBox(height: 10),

                    // Service row 2: Luggage + Tickets
                    buildServiceRow(
                      leftTitle: 'Luggage',
                      leftIcon: Icons.luggage,
                      leftColor: AppColors.white,
                      rightTitle: 'Tickets',
                      rightIcon: Icons.airplane_ticket,
                      rightColor: AppColors.coral,
                      leftShowTitle: false,
                      rightShowTitle: true,
                      leftFlex: 2,
                      rightFlex: 3,
                    ),

                    const SizedBox(height: 10),

                    // Service row 3: Car Rent + Messages
                    buildServiceRow(
                      leftTitle: 'Car Rent',
                      leftIcon: Icons.directions_car,
                      leftColor: AppColors.green,
                      rightTitle: 'Messages',
                      rightIcon: Icons.forum,
                      rightColor: AppColors.white,
                      leftShowTitle: true,
                      rightShowTitle: false,
                      leftFlex: 3,
                      rightFlex: 2,
                    ),

                    const SizedBox(height: 28),

                    // Upcoming departures heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Upcoming departures',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize: 15,
                          ),
                        ),
                        InkWell(
                          onTap: () => handleServiceTap('View all departures'),
                          child: const Row(
                            children: [
                              Text(
                                'View all',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.north_east,
                                color: AppColors.yellow,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Departure list
                    DepartureItem(
                      route: 'Singapore - San Francisco',
                      gate: 'Gate 1C',
                      dateTime: '27 Aug 2022 13:22',
                      onTap: () => handleServiceTap('Singapore - San Francisco'),
                    ),

                    DepartureItem(
                      route: 'Singapore - New York',
                      gate: 'Gate 2B',
                      dateTime: '27 Aug 2022 14:11',
                      onTap: () => handleServiceTap('Singapore - New York'),
                    ),
                    DepartureItem(
                      route: 'Lahore - Karachi',
                      gate: 'Gate 2F',
                      dateTime: '27 Aug 2022 14:11',
                      onTap: () => handleServiceTap('Singapore - New York'),
                    ),
                    DepartureItem(
                      route: 'Jeddah - Riyadh',
                      gate: 'Gate 23B',
                      dateTime: '27 Aug 2022 14:11',
                      onTap: () => handleServiceTap('Singapore - New York'),
                    ),
                    DepartureItem(
                      route: 'Quetta - Karachi',
                      gate: 'Gate 2V',
                      dateTime: '27 Aug 2022 14:11',
                      onTap: () => handleServiceTap('Singapore - New York'),
                    ),
                    DepartureItem(
                      route: 'Karachi - Riyadh',
                      gate: 'Gate 29J',
                      dateTime: '27 Aug 2022 14:11',
                      onTap: () => handleServiceTap('Singapore - New York'),
                    ),
                  ],
                ),
              ),
            ),

            // Floating bottom navigation
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Center(
                child: BottomNavPill(
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
