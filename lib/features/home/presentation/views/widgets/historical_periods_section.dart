import 'package:flutter/material.dart';

import '../../../../../core/utils/app_string.dart';
import '../home_view.dart';
import 'historical_periods_categories.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeader(
          text: AppStrings.historicalPeriods,
        ),
        SizedBox(
          height: 16,
        ),
        HistoricalPeriodsCategoies()
      ],
    );
  }
}
