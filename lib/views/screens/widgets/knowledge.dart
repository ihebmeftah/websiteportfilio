import 'package:flutter/material.dart';

import '../../theme/theme.dart';

knowledge({required String label}) {
  return Row(
    children: [
      const Icon(Icons.check, color: primaryColor),
      const SizedBox(
        width: defaultPadding / 2,
      ),
      Text(label),
    ],
  );
}
