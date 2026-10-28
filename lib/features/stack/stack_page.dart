import 'package:flutter/material.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/features/footer/site_footer.dart';
import 'package:websiteportfilio/features/stack/tech_catalog.dart';
import 'package:websiteportfilio/features/stack/tech_mark.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/shared/widgets/fade_slide_in.dart';
import 'package:websiteportfilio/shared/widgets/magnetic_surface.dart';
import 'package:websiteportfilio/shared/widgets/page_frame.dart';
import 'package:websiteportfilio/shared/widgets/section_intro.dart';

class StackPage extends StatefulWidget {
  const StackPage({this.focus, super.key});

  final String? focus;

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  final Map<String, GlobalKey> _anchors = {
    for (final family in techCatalog) family.id: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _revealFocus(animate: false);
  }

  @override
  void didUpdateWidget(StackPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focus != widget.focus) {
      _revealFocus(animate: true);
    }
  }

  void _revealFocus({required bool animate}) {
    final id = widget.focus;
    if (id == null || !_anchors.containsKey(id)) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final target = _anchors[id]?.currentContext;
      if (target == null) {
        return;
      }
      Scrollable.ensureVisible(
        target,
        duration: animate ? const Duration(milliseconds: 420) : Duration.zero,
        curve: Curves.easeOutCubic,
        alignment: 0.04,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: PageFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeSlideIn(
              child: SectionIntro(
                title: l10n.sectionStack,
                subtitle: l10n.stackIntro,
              ),
            ),
            const SizedBox(height: 36),
            for (var i = 0; i < techCatalog.length; i++)
              Padding(
                key: _anchors[techCatalog[i].id],
                padding: const EdgeInsets.only(bottom: 42),
                child: FadeSlideIn(
                  delay: Duration(milliseconds: 70 + (i * 80)),
                  child: _FamilyBlock(family: techCatalog[i]),
                ),
              ),
            const SiteFooter(),
          ],
        ),
      ),
    );
  }
}

class _FamilyBlock extends StatelessWidget {
  const _FamilyBlock({required this.family});

  final TechFamily family;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = context.portfolioColors;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TechMark(
              color: family.color,
              icon: family.icon,
              label: family.title(l10n),
              size: 58,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    family.title(l10n),
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 34,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    family.line(l10n),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colors.muted,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${family.tools.length}',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colors.accent,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        MagneticSurface(
          color: colors.accentSoft,
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.stackWhere.toUpperCase(),
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colors.accent,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                family.proof(l10n),
                style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _ToolGrid(tools: family.tools),
      ],
    );
  }
}

class _ToolGrid extends StatelessWidget {
  const _ToolGrid({required this.tools});

  final List<TechTool> tools;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 900
            ? 3
            : constraints.maxWidth >= 560
            ? 2
            : 1;
        const gap = 14.0;
        final rows = (tools.length / columns).ceil();

        return Column(
          children: [
            for (var row = 0; row < rows; row++) ...[
              if (row > 0) const SizedBox(height: gap),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var column = 0; column < columns; column++) ...[
                      if (column > 0) const SizedBox(width: gap),
                      Expanded(
                        child: _cell(
                          context,
                          l10n,
                          index: row * columns + column,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _cell(
    BuildContext context,
    AppLocalizations l10n, {
    required int index,
  }) {
    if (index >= tools.length) {
      return const SizedBox.shrink();
    }
    return _ToolCard(tool: tools[index], l10n: l10n);
  }
}

class _ToolCard extends StatelessWidget {
  const _ToolCard({required this.tool, required this.l10n});

  final TechTool tool;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    final theme = Theme.of(context);

    return MagneticSurface(
      depth: 0.72,
      borderRadius: const BorderRadius.all(Radius.circular(22)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TechMark.fromTool(tool),
          const SizedBox(height: 14),
          Text(
            tool.category(l10n).toUpperCase(),
            style: theme.textTheme.labelLarge?.copyWith(
              color: colors.accent,
              fontSize: 11,
              letterSpacing: 1.05,
            ),
          ),
          const SizedBox(height: 4),
          Text(tool.name, style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            tool.detail(l10n),
            style: theme.textTheme.bodyMedium?.copyWith(color: colors.muted),
          ),
        ],
      ),
    );
  }
}
