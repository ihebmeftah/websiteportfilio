import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:websiteportfilio/core/responsive/breakpoints.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/core/utils/download_file.dart';
import 'package:websiteportfilio/core/utils/open_external.dart';
import 'package:websiteportfilio/features/portfolio/portfolio_content.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/providers/settings_providers.dart';

class SiteFooter extends ConsumerWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    final wide = Breakpoints.isDesktop(context);
    final focus = ref.watch(profileFocusProvider);
    final profile = focus == ProfileFocus.software
        ? l10n.profileSoftware
        : l10n.profileMobile;

    final cv = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.footerCvTitle, style: theme.textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(
          l10n.footerCvBody(profile),
          style: theme.textTheme.bodyMedium?.copyWith(color: colors.muted),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            OutlinedButton.icon(
              onPressed: () => _download(focus, 'en'),
              icon: const Icon(Icons.download),
              label: Text(l10n.footerCvEnglish),
            ),
            OutlinedButton.icon(
              onPressed: () => _download(focus, 'de'),
              icon: const Icon(Icons.download),
              label: Text(l10n.footerCvGerman),
            ),
          ],
        ),
      ],
    );

    final credit = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.footerBuilt, style: theme.textTheme.bodyLarge),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: () => openExternal(PortfolioLinks.repository),
          icon: const Icon(Icons.code),
          label: Text(PortfolioLinks.repositoryLabel),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(top: 48),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: colors.line)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 28),
          child: wide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 6, child: cv),
                    const SizedBox(width: 28),
                    Expanded(flex: 5, child: credit),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [cv, const SizedBox(height: 28), credit],
                ),
        ),
      ),
    );
  }

  Future<void> _download(ProfileFocus focus, String languageCode) {
    final file = cvFor(focus: focus, languageCode: languageCode);
    return downloadAsset(assetPath: file.assetPath, filename: file.filename);
  }
}

class CvFile {
  const CvFile({required this.assetPath, required this.filename});

  final String assetPath;
  final String filename;
}

CvFile cvFor({required ProfileFocus focus, required String languageCode}) {
  final software = focus == ProfileFocus.software;
  if (languageCode == 'de') {
    return software
        ? const CvFile(
            assetPath: 'cv/Lebenslauf_Software_Engineer_DE_Iheb_Meftah.pdf',
            filename: 'Iheb_Meftah_Lebenslauf_Software_DE.pdf',
          )
        : const CvFile(
            assetPath: 'cv/Lebenslauf_Flutter_Mobil_DE_Iheb_Meftah.pdf',
            filename: 'Iheb_Meftah_Lebenslauf_Mobile_DE.pdf',
          );
  }
  return software
      ? const CvFile(
          assetPath: 'cv/Europass_Software_Engineer_Iheb_Meftah.pdf',
          filename: 'Iheb_Meftah_CV_Software_EN.pdf',
        )
      : const CvFile(
          assetPath: 'cv/Europass_Flutter_Mobile_Iheb_Meftah.pdf',
          filename: 'Iheb_Meftah_CV_Mobile_EN.pdf',
        );
}
