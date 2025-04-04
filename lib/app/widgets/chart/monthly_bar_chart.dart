import 'package:apex/app/utils/helpers/app_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlyBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.getHeight(30),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 10,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        const style = TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        );

                        switch (value.toInt()) {
                          case 0:
                            return Text('Jan', style: style);
                          case 1:
                            return Text('Feb', style: style);
                          case 2:
                            return Text('Mar', style: style);
                          case 3:
                            return Text('Apr', style: style);
                          case 4:
                            return Text('May', style: style);
                          case 5:
                            return Text('Jun', style: style);
                          case 6:
                            return Text('Jul', style: style);
                          case 7:
                            return Text('Aug', style: style);
                          case 8:
                            return Text('Sep', style: style);
                          case 9:
                            return Text('Oct', style: style);
                          case 10:
                            return Text('Nov', style: style);
                          case 11:
                            return Text('Dec', style: style);
                          default:
                            return Text('');
                        }
                      },
                    ),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  getDrawingHorizontalLine: (value) =>
                      FlLine(color: Colors.grey.shade300, strokeWidth: 1),
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: _getBarGroups(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    final List<double> barValues = [3, 5, 8, 2, 6, 3, 5, 8, 2, 3, 6, 7];

    return barValues.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            color: Colors.orange,
            width: 12,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();
  }
}
