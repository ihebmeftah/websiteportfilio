import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:websiteportfilio/core/responsive/breakpoints.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/features/portfolio/portfolio_content.dart';
import 'package:websiteportfilio/features/portfolio/profile_switcher.dart';
import 'package:websiteportfilio/features/footer/site_footer.dart';
import 'package:websiteportfilio/features/projects/project_card.dart';
import 'package:websiteportfilio/features/stack/tech_preview.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/providers/settings_providers.dart';
import 'package:websiteportfilio/shared/widgets/fade_slide_in.dart';
import 'package:websiteportfilio/shared/widgets/magnetic_surface.dart';
import 'package:websiteportfilio/shared/widgets/page_frame.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final copy = profileCopyOf(l10n, ref.watch(profileFocusProvider));
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    final wide = Breakpoints.isDesktop(context);
    final width = MediaQuery.sizeOf(context).width;
    final nameSize = width >= 1180 ? 86.0 : (wide ? 64.0 : 48.0);
    final projects = projectsOf(l10n);

    final stats = [
      (value: l10n.statSinceValue, label: l10n.statSinceLabel),
      (value: l10n.statAppsValue, label: l10n.statAppsLabel),
      (value: l10n.statPlaceValue, label: l10n.statPlaceLabel),
    ];

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeSlideIn(child: _Kicker(label: copy.kicker)),
        const SizedBox(height: 18),
        FadeSlideIn(
          delay: const Duration(milliseconds: 80),
          child: Text(
            l10n.heroName,
            style: theme.textTheme.displayLarge?.copyWith(
              fontSize: nameSize,
              height: 0.92,
              letterSpacing: wide ? -2.4 : -1.4,
            ),
          ),
        ),
        const SizedBox(height: 14),
        FadeSlideIn(
          delay: const Duration(milliseconds: 140),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            child: Text(
              copy.role,
              key: ValueKey(copy.role),
              style: theme.textTheme.headlineSmall?.copyWith(
                color: colors.accent,
                fontSize: wide ? 30 : 22,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const FadeSlideIn(
          delay: Duration(milliseconds: 180),
          child: ProfileSwitcher(),
        ),
        const SizedBox(height: 18),
        FadeSlideIn(
          delay: const Duration(milliseconds: 200),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: Text(
                copy.summary,
                key: ValueKey(copy.summary),
                style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
              ),
            ),
          ),
        ),
        const SizedBox(height: 26),
        FadeSlideIn(
          delay: const Duration(milliseconds: 260),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton(
                onPressed: () => context.go('/work'),
                child: Text(l10n.ctaWork),
              ),
              OutlinedButton(
                onPressed: () => context.go('/contact'),
                child: Text(l10n.ctaContact),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        FadeSlideIn(
          delay: const Duration(milliseconds: 320),
          child: _StatRow(stats: stats, stacked: !wide),
        ),
      ],
    );

    final portrait = FadeSlideIn(
      delay: const Duration(milliseconds: 160),
      child: const _Portrait(),
    );

    return SingleChildScrollView(
      child: PageFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 12, child: intro),
                  const SizedBox(width: 36),
                  const Expanded(flex: 10, child: _PortraitSlot()),
                ],
              )
            else ...[
              intro,
              const SizedBox(height: 28),
              portrait,
            ],
            const SizedBox(height: 56),
            const FadeSlideIn(
              delay: Duration(milliseconds: 380),
              child: TechPreview(),
            ),
            const SizedBox(height: 56),
            FadeSlideIn(
              delay: const Duration(milliseconds: 460),
              child: Text(
                l10n.projectsIntro,
                style: theme.textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 500,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                padding: const EdgeInsets.fromLTRB(2, 18, 8, 36),
                itemCount: projects.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 340,
                    child: ProjectCard(
                      project: projects[index],
                      index: index,
                      compact: true,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${l10n.heroName}  ·  ${l10n.location}',
              style: theme.textTheme.bodyMedium?.copyWith(color: colors.muted),
            ),
            const SiteFooter(),
          ],
        ),
      ),
    );
  }
}

class _PortraitSlot extends StatelessWidget {
  const _PortraitSlot();

  @override
  Widget build(BuildContext context) {
    return const _Portrait();
  }
}

class _Kicker extends StatelessWidget {
  const _Kicker({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: colors.accentSoft,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: colors.lamp,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: colors.accent,
              letterSpacing: 1.3,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.stats, required this.stacked});

  final List<({String value, String label})> stats;
  final bool stacked;

  @override
  Widget build(BuildContext context) {
    final cards = [
      for (final stat in stats)
        MagneticSurface(
          depth: 0.72,
          borderRadius: const BorderRadius.all(Radius.circular(22)),
          padding: const EdgeInsets.all(16),
          child: _StatBody(value: stat.value, label: stat.label),
        ),
    ];

    if (stacked) {
      return Column(
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            cards[i],
          ],
        ],
      );
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i > 0) const SizedBox(width: 10),
            Expanded(child: cards[i]),
          ],
        ],
      ),
    );
  }
}

class _StatBody extends StatelessWidget {
  const _StatBody({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: colors.accent,
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(color: colors.muted),
        ),
      ],
    );
  }
}

class _Portrait extends StatelessWidget {
  const _Portrait();

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 6, bottom: 6),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 22,
            top: 22,
            right: 0,
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors.accent,
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 22, bottom: 22),
            child: AspectRatio(
              aspectRatio: 4 / 5,
              child: MagneticSurface(
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/portrait.jpg',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      semanticLabel: l10n.heroName,
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B1730)
                              .withValues(alpha: 0.72),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: colors.lamp,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                l10n.location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
