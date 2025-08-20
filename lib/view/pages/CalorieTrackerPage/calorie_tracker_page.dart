import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:workout_helper_app/view/pages/CalorieTrackerPage/widget/buildNutrientCard.dart';

class CalorieTrackerPage extends StatelessWidget {
  const CalorieTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Calorie Tracker'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    '372',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'kcal left',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNutrientCard('Carbs', '281/305g', 0.92),
                buildNutrientCard('Protein', '20/182g', 0.11),
                buildNutrientCard('Fat', '120/210g', 0.57),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Today',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 230,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barTouchData: BarTouchData(
                    enabled: false,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          );
                          Widget text;
                          switch (value.toInt()) {
                            case 0:
                              text = const Text('M', style: style);
                              break;
                            case 1:
                              text = const Text('T', style: style);
                              break;
                            case 2:
                              text = const Text('W', style: style);
                              break;
                            case 3:
                              text = const Text('T', style: style);
                              break;
                            case 4:
                              text = const Text('F', style: style);
                              break;
                            case 5:
                              text = const Text('S', style: style);
                              break;
                            case 6:
                              text = const Text('S', style: style);
                              break;
                            default:
                              text = const Text('', style: style);
                              break;
                          }
                          return SideTitleWidget(
                            meta: meta,
                            // axisSide: meta.axisSide,
                            space: 5.0,
                            child: text,
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8,  color: Theme.of(context).primaryColor)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10, color: Theme.of(context).primaryColor)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14, color: Theme.of(context).primaryColor)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15, color: Theme.of(context).primaryColor)]),
                    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 13, color: Theme.of(context).primaryColor)]),
                    BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 10, color: Theme.of(context).primaryColor)]),
                    BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 16, color: Theme.of(context).primaryColor)]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}