import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/providers/settings_providers.dart';

class LanguageGate extends ConsumerWidget {
  const LanguageGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    final canDismiss = ref.watch(localeProvider) != null;
    final choices = [
      (code: 'en', name: 'English', detail: 'Continue in English'),
      (code: 'de', name: 'Deutsch', detail: 'Auf Deutsch fortfahren'),
      (code: 'fr', name: 'Français', detail: 'Continuer en français'),
    ];

    return Material(
      color: colors.canvas.withValues(alpha: 0.97),
      child: GestureDetector(
        onTap: canDismiss
            ? () => ref.read(languagePromptProvider.notifier).dismiss()
            : null,
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: GestureDetector(
                onTap: () {},
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colors.ink,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'IM',
                          style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontWeight: FontWeight.w600,
                            color: colors.canvas,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      Text(
                        'Choose your language',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sprache wählen  ·  Choisissez votre langue',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.muted,
                        ),
                      ),
                      const SizedBox(height: 28),
                      for (final choice in choices) ...[
                        _LanguageChoice(
                          name: choice.name,
                          detail: choice.detail,
                          onTap: () {
                            ref
                                .read(localeProvider.notifier)
                                .setLocale(choice.code);
                            ref.read(languagePromptProvider.notifier).dismiss();
                          },
                        ),
                        const SizedBox(height: 12),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageChoice extends StatelessWidget {
  const _LanguageChoice({
    required this.name,
    required this.detail,
    required this.onTap,
  });

  final String name;
  final String detail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    final theme = Theme.of(context);

    return Material(
      color: colors.card,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: colors.line),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 2),
                    Text(
                      detail,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.muted,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward, color: colors.accent),
            ],
          ),
        ),
      ),
    );
  }
}
