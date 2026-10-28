import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/providers/settings_providers.dart';

class ProfileSwitcher extends ConsumerWidget {
  const ProfileSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final focus = ref.watch(profileFocusProvider);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _ProfileChip(
          label: l10n.profileMobile,
          selected: focus == ProfileFocus.mobile,
          onPressed: () => ref
              .read(profileFocusProvider.notifier)
              .setFocus(ProfileFocus.mobile),
        ),
        _ProfileChip(
          label: l10n.profileSoftware,
          selected: focus == ProfileFocus.software,
          onPressed: () => ref
              .read(profileFocusProvider.notifier)
              .setFocus(ProfileFocus.software),
        ),
      ],
    );
  }
}

class _ProfileChip extends StatelessWidget {
  const _ProfileChip({
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: selected ? colors.ink : colors.card,
        foregroundColor: selected ? colors.canvas : colors.ink,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: const StadiumBorder(),
        side: BorderSide(color: selected ? colors.ink : colors.line),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: selected ? colors.canvas : colors.ink,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }
}
