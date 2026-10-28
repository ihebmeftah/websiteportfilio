import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/features/portfolio/portfolio_content.dart';
import 'package:websiteportfilio/features/portfolio/profile_switcher.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/providers/settings_providers.dart';
import 'package:websiteportfilio/shared/widgets/fade_slide_in.dart';
import 'package:websiteportfilio/shared/widgets/magnetic_surface.dart';
import 'package:websiteportfilio/shared/widgets/page_frame.dart';
import 'package:websiteportfilio/shared/widgets/section_intro.dart';
import 'package:websiteportfilio/shared/widgets/skill_wrap.dart';

class WorkPage extends ConsumerWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final copy = profileCopyOf(l10n, ref.watch(profileFocusProvider));
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    final jobs = experienceOf(l10n);

    return SingleChildScrollView(
      child: PageFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeSlideIn(
              child: SectionIntro(
                title: l10n.sectionWork,
                subtitle: copy.workIntro,
              ),
            ),
            const SizedBox(height: 18),
            const FadeSlideIn(
              delay: Duration(milliseconds: 40),
              child: ProfileSwitcher(),
            ),
            const SizedBox(height: 28),
            for (var i = 0; i < jobs.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: FadeSlideIn(
                  delay: Duration(milliseconds: 90 + (i * 70)),
                  child: _JobCard(item: jobs[i], index: i),
                ),
              ),
            const SizedBox(height: 12),
            FadeSlideIn(
              delay: const Duration(milliseconds: 420),
              child: MagneticSurface(
                color: colors.accentSoft,
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.educationTitle,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colors.accent,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.educationDegree,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.educationSchool,
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.educationDates,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.muted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36),
            Text(l10n.skillsTitle, style: theme.textTheme.titleLarge),
            const SizedBox(height: 14),
            const SkillWrap(),
          ],
        ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  const _JobCard({required this.item, required this.index});

  final ExperienceItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    final label = (index + 1).toString().padLeft(2, '0');

    return MagneticSurface(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 64,
            child: Text(
              label,
              style: theme.textTheme.displaySmall?.copyWith(
                color: colors.accent,
                fontSize: 32,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.dates,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colors.accent,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(item.title, style: theme.textTheme.titleLarge),
                const SizedBox(height: 2),
                Text(
                  item.org,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colors.muted,
                  ),
                ),
                const SizedBox(height: 10),
                Text(item.body, style: theme.textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
