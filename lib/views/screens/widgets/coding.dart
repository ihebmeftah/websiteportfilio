import 'package:flutter/material.dart';

import '../../theme/theme.dart';

coding({BuildContext? context, required String label, required double perc}) {
  return TweenAnimationBuilder(
    duration: defaultDuration,
    tween: Tween<double>(begin: 0, end: perc),
    builder: (BuildContext context, double value, Widget? child) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
              ),
              Text(
                ('${(value * 100).toInt()}%'),
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          LinearProgressIndicator(
            value: value,
            color: primaryColor,
            backgroundColor: darkColor,
          ),
        ],
      );
    },
  );
}
