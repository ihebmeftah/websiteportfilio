import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:websiteportfilio/core/responsive/breakpoints.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/features/stack/tech_catalog.dart';
import 'package:websiteportfilio/features/stack/tech_mark.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/shared/widgets/magnetic_surface.dart';

class TechPreview extends StatelessWidget {
  const TechPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    final wide = Breakpoints.isDesktop(context);

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.sectionStack,
          style: theme.textTheme.displaySmall?.copyWith(
            fontSize: wide ? 46 : 34,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 64,
          height: 4,
          decoration: BoxDecoration(
            color: colors.lamp,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          l10n.stackIntro,
          style: theme.textTheme.titleMedium?.copyWith(color: colors.muted),
        ),
      ],
    );

    final action = OutlinedButton(
      onPressed: () => context.go('/stack'),
      child: Text(l10n.stackOpen),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (wide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: intro),
              const SizedBox(width: 18),
              action,
            ],
          )
        else ...[
          intro,
          const SizedBox(height: 16),
          action,
        ],
        const SizedBox(height: 22),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 900 ? 3 : 1;
            const gap = 14.0;
            if (columns == 1) {
              return Column(
                children: [
                  for (var i = 0; i < techCatalog.length; i++) ...[
                    if (i > 0) const SizedBox(height: gap),
                    _FamilyPreview(family: techCatalog[i]),
                  ],
                ],
              );
            }
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < techCatalog.length; i++) ...[
                    if (i > 0) const SizedBox(width: gap),
                    Expanded(child: _FamilyPreview(family: techCatalog[i])),
                  ],
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _FamilyPreview extends StatelessWidget {
  const _FamilyPreview({required this.family});

  final TechFamily family;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    final names = family.tools.map((tool) => tool.name).join(' · ');

    return MagneticSurface(
      onTap: () => context.go('/stack?focus=${family.id}'),
      depth: 0.8,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TechMark(
            color: family.color,
            icon: family.icon,
            label: family.title(l10n),
            size: 52,
          ),
          const SizedBox(height: 14),
          Text(family.title(l10n), style: theme.textTheme.titleLarge),
          const SizedBox(height: 6),
          Text(
            family.line(l10n),
            style: theme.textTheme.bodyMedium?.copyWith(color: colors.muted),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tool in family.tools)
                Tooltip(
                  message: tool.name,
                  child: TechMark.fromTool(tool, size: 34),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            names,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.muted,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            l10n.stackFamilyCta,
            style: theme.textTheme.labelLarge?.copyWith(color: colors.accent),
          ),
        ],
      ),
    );
  }
}
