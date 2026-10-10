import 'package:flutter/material.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/features/portfolio/portfolio_content.dart';
import 'package:websiteportfilio/shared/widgets/magnetic_surface.dart';

class SkillWrap extends StatelessWidget {
  const SkillWrap({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final skill in PortfolioLinks.skills)
          MagneticSurface(
            depth: 0.28,
            borderRadius: const BorderRadius.all(Radius.circular(999)),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Text(
              skill,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                letterSpacing: 0.2,
                fontWeight: FontWeight.w600,
                color: colors.ink,
              ),
            ),
          ),
      ],
    );
  }
}
