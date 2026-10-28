import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:websiteportfilio/core/responsive/breakpoints.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/core/utils/open_external.dart';
import 'package:websiteportfilio/features/portfolio/portfolio_content.dart';
import 'package:websiteportfilio/features/portfolio/profile_switcher.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/providers/settings_providers.dart';
import 'package:websiteportfilio/shared/widgets/fade_slide_in.dart';
import 'package:websiteportfilio/shared/widgets/magnetic_surface.dart';
import 'package:websiteportfilio/shared/widgets/page_frame.dart';
import 'package:websiteportfilio/shared/widgets/section_intro.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final copy = profileCopyOf(l10n, ref.watch(profileFocusProvider));
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    final wide = Breakpoints.isDesktop(context);
    final languages = languagesOf(l10n);

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeSlideIn(
          child: SectionIntro(
            title: l10n.sectionContact,
            subtitle: copy.contactIntro,
          ),
        ),
        const SizedBox(height: 16),
        const ProfileSwitcher(),
        const SizedBox(height: 18),
        Text(
          copy.availability,
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.55),
        ),
        const SizedBox(height: 32),
        Text(l10n.languagesTitle, style: theme.textTheme.titleLarge),
        const SizedBox(height: 14),
        for (final language in languages) ...[
          Row(
            children: [
              Expanded(
                child: Text(language.name, style: theme.textTheme.titleSmall),
              ),
              Text(
                language.level,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.muted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 7,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: colors.line,
              borderRadius: BorderRadius.circular(99),
            ),
            child: FractionallySizedBox(
              widthFactor: language.fluency,
              heightFactor: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.accent,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
        ],
      ],
    );

    final details = Column(
      children: [
        _ContactTile(
          icon: Icons.mail_outline,
          label: l10n.emailLabel,
          value: PortfolioLinks.emailText,
          onTap: () => openExternal(PortfolioLinks.email),
        ),
        _ContactTile(
          icon: Icons.phone_outlined,
          label: l10n.phoneLabel,
          value: PortfolioLinks.phoneText,
          onTap: () => openExternal(PortfolioLinks.phone),
        ),
        _ContactTile(
          icon: Icons.link,
          label: l10n.linkedinLabel,
          value: 'linkedin.com/in/ihebmeftah666',
          onTap: () => openExternal(PortfolioLinks.linkedin),
        ),
        _ContactTile(
          icon: Icons.code,
          label: l10n.githubLabel,
          value: 'github.com/ihebmeftah',
          onTap: () => openExternal(PortfolioLinks.github),
        ),
        _ContactTile(
          icon: Icons.place_outlined,
          label: l10n.locationTitle,
          value: l10n.location,
          onTap: null,
        ),
      ],
    );

    return SingleChildScrollView(
      child: PageFrame(
        child: wide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: intro),
                  const SizedBox(width: 36),
                  Expanded(child: details),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [intro, const SizedBox(height: 12), details],
              ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MagneticSurface(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(22)),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors.accentSoft,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: colors.accent),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.accent,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(value, style: theme.textTheme.titleSmall),
                ],
              ),
            ),
            if (onTap != null)
              Icon(Icons.arrow_outward, color: colors.muted, size: 18),
          ],
        ),
      ),
    );
  }
}
