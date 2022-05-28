import 'package:flutter/material.dart';

import '../../theme/theme.dart';

skills({BuildContext? context, required String label, required double perc}) {
  return Column(
    children: [
      AspectRatio(
        aspectRatio: 1,
        child: TweenAnimationBuilder(
          duration: defaultDuration,
          tween: Tween<double>(begin: 0, end: perc),
          builder: (BuildContext context, double value, Widget? child) {
            return Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: value,
                  color: primaryColor,
                  backgroundColor: darkColor,
                ),
                Center(
                  child: Text(
                    ('${(value * 100).toInt()}%'),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      const SizedBox(
        height: defaultPadding / 2,
      ),
      Text(
        label,
        style: Theme.of(context!).textTheme.subtitle1,
      )
    ],
  );
}
