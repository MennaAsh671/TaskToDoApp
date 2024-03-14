import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  final double percent;
  final double radius;
  final double fontSize;
  final double lineWidth;

  const MyCircularProgressIndicator({
    super.key,
    required this.percent,
    this.radius = 16,
    this.fontSize = 8,
    this.lineWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      circularStrokeCap: CircularStrokeCap.round,
      radius: radius,
      lineWidth: lineWidth,
      percent: percent,
      center: Text(
        "${(percent * 100).toInt()}%",
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
      backgroundColor: Colors.black54,
      progressColor: Colors.blueAccent,
    );
  }
}
