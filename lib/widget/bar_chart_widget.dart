import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../constant/constant.dart';
import '../model/form_entity.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key, required this.formData}) : super(key: key);

  final FormEntity formData;
  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('JobKnowledge', widget.formData.jobKnowledge.toDouble()),
      _ChartData('achievements', widget.formData.achievements.toDouble()),
      _ChartData('creativity', widget.formData.creativity.toDouble()),
      _ChartData('leadership', widget.formData.leadership.toDouble()),
      _ChartData('communicationSkill', widget.formData.communicationSkill.toDouble()),
      _ChartData('projects', widget.formData.projects.toDouble()),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SfCartesianChart(
            title: ChartTitle(
                text: 'Bar Graph',
                borderWidth: 2,
                // Aligns the chart title to left
                alignment: ChartAlignment.center,
                textStyle: TextStyle(
                  color: kPrimaryTextColour,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                )
            ),
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 5, interval: 0.5),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Gold',
                  color: const Color.fromRGBO(8, 142, 255, 1))
            ]));

  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}