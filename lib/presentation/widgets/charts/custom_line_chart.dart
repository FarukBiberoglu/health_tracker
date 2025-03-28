import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class CustomLineChartData {
  const CustomLineChartData({
    required this.xLabel,
    required this.yLabel,
    required this.y,
  });

  final String xLabel;
  final String yLabel;
  final double y;
}

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({
    required this.data,
    required this.minY,
    required this.maxY,
    super.key,
  });

  final List<CustomLineChartData> data;
  final double minY;
  final double maxY;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: (maxY - minY) / 5,
              reservedSize: 50,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: AppValues.sm.ext.padding.directional.right,
                  child: Text(
                    value.toStringAsFixed(0),
                    textAlign: TextAlign.end,
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: AppValues.sm.ext.padding.directional.top,
                  child: Text(
                    data[value.toInt()].xLabel,
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
        ),
        clipData: const FlClipData.all(),
        gridData: FlGridData(
          verticalInterval: 1,
          horizontalInterval: (maxY - minY) / 5,
          getDrawingHorizontalLine:
              (value) => FlLine(color: Colors.grey.shade300, strokeWidth: 0.5),
          getDrawingVerticalLine:
              (value) => FlLine(color: Colors.grey.shade300, strokeWidth: 0.5),
        ),
        minX: 0,
        maxX: data.length.toDouble() - 1,
        minY: minY,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            spots:
                data.asMap().entries.map((entry) {
                  final index = entry.key;
                  final spot = entry.value;
                  return FlSpot(index.toDouble(), spot.y);
                }).toList(),
            isCurved: true,
            gradient: LinearGradient(
              colors:
                  data.map((spot) {
                    return Color.lerp(
                      Colors.greenAccent,
                      Colors.redAccent,
                      spot.y / maxY,
                    )!;
                  }).toList(),
            ),
            barWidth: 5,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors:
                    data
                        .map((spot) {
                          return Color.lerp(
                            Colors.greenAccent,
                            Colors.redAccent,
                            spot.y / maxY,
                          )!;
                        })
                        .map((color) => color.withValues(alpha: 0.6))
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
