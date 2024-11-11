import 'package:flutter/material.dart';

import 'historical_periods_item.dart';

class HistoricalPeriodsCategoies extends StatelessWidget {
  const HistoricalPeriodsCategoies({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: HistoricalPeriodsItem()),
        SizedBox(
          width: 16,
        ),
        Expanded(child: HistoricalPeriodsItem()),
      ],
    );
  }
}
