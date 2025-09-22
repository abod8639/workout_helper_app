import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/testcontroller.dart';
import 'package:workout_helper_app/test/test1.dart';

// import 'package:workout_helper_app/controller/testcontroller.dart';

class MonthlySummary extends StatefulWidget {
  final Map<DateTime, int> datasets;
  // final String startDate;

  const MonthlySummary({super.key, required this.datasets});

  @override
  State<MonthlySummary> createState() => _MonthlySummaryState();
}

class _MonthlySummaryState extends State<MonthlySummary>
    with SingleTickerProviderStateMixin {
  final habitController = Get.put(HabitController());
  // late final datasets = habitController.db.heatmapDateSet;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDateTime;
    try {
      startDateTime = createDateTimeObject(habitController.getStartDay());
    } catch (e) {
      startDateTime = DateTime.now().subtract(const Duration(days: 30));
    }

    final themeColors = Theme.of(context).colorScheme;
    final primaryColor = themeColors.primary;

    final colorsets = {
      1: primaryColor.withOpacity(0.1),
      2: primaryColor.withOpacity(0.2),
      3: primaryColor.withOpacity(0.3),
      4: primaryColor.withOpacity(0.4),
      5: primaryColor.withOpacity(0.5),
      6: primaryColor.withOpacity(0.6),
      7: primaryColor.withOpacity(0.7),
      8: primaryColor.withOpacity(0.8),
      9: primaryColor.withOpacity(0.9),
     10: primaryColor.withOpacity(1.0),
    };

    // Removed unused and erroneous MediaQuerysize function.

    final double topPadding = MediaQuery.of(context).size.width * 0.05;
    // final double mHeatMapSize = MediaQuery.of(context).size.height * 0.075;
    // final double heatMapSize =
    //     MediaQuery.of(context).size.width > 600 ? mHeatMapSize : 37;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(_animationController),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 2, top: topPadding, bottom: 25),
              child: HeatMap(
                startDate: startDateTime,
                fontSize: 16,
                endDate: DateTime.now().add(const Duration(days: 15)),
                colorMode: ColorMode.color,
                defaultColor: Colors.grey[400]!.withAlpha(20),
                textColor: themeColors.onSurface,
                showColorTip: false,
                showText: true,
                scrollable: true,
                size: 37,// heatMapSize,
                // size: topPadding,
                colorsets: colorsets,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 2.6, top: topPadding, bottom: 25),
              child: HeatMap(
                startDate: startDateTime,
                fontSize: 16,
                endDate: DateTime.now().add(const Duration(days: 0)),
                datasets: widget.datasets,
                colorMode: ColorMode.color,
                defaultColor: Colors.grey[400]!,
                textColor: themeColors.onSurface,
                showColorTip: false,
                showText: true,
                scrollable: true,
                size:37,// heatMapSize,
                // size: topPadding,
                colorsets: colorsets,
                onClick: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primary.withAlpha(100),
                      duration: const Duration(seconds: 1),
                      content: Center(
                        child: Text(
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          value.toString().replaceAll("00:00:00.000", " "),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
