import 'package:flutter/material.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';

class SectionIntro extends StatelessWidget {
  const SectionIntro({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    final wide = MediaQuery.sizeOf(context).width >= 960;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.displaySmall?.copyWith(
            fontSize: wide ? 52 : 38,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 64,
          height: 4,
          decoration: BoxDecoration(
            color: colors.lamp,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Text(
            subtitle,
            style: theme.textTheme.titleMedium?.copyWith(color: colors.muted),
          ),
        ),
      ],
    );
  }
}
