import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:websiteportfilio/core/responsive/breakpoints.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/providers/settings_providers.dart';
import 'package:websiteportfilio/shared/widgets/cursor_glow.dart';
import 'package:websiteportfilio/shared/widgets/pointer_field.dart';

/// Browser-tab title. The name stays first so it remains visible when the tab is narrow.
String portfolioTabTitle(AppLocalizations l10n, String path) {
  final section = switch (path) {
    '/' => null,
    _ when path.startsWith('/work') => l10n.navWork,
    _ when path.startsWith('/stack') => l10n.navStack,
    _ when path.startsWith('/projects') => l10n.navProjects,
    _ when path.startsWith('/contact') => l10n.navContact,
    _ => null,
  };
  final name = l10n.appTitle;
  if (section == null) {
    return '$name — Portfolio';
  }
  return '$name — $section';
}

class PortfolioShell extends ConsumerWidget {
  const PortfolioShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final colors = context.portfolioColors;
    final wide = Breakpoints.isDesktop(context);
    final path = GoRouterState.of(context).uri.path;

    final destinations = [
      (path: '/', label: l10n.navHome),
      (path: '/work', label: l10n.navWork),
      (path: '/stack', label: l10n.navStack),
      (path: '/projects', label: l10n.navProjects),
      (path: '/contact', label: l10n.navContact),
    ];

    return Title(
      title: portfolioTabTitle(l10n, path),
      color: colors.ink,
      child: Scaffold(
        backgroundColor: colors.canvas,
        drawer: wide
            ? null
            : Drawer(
                backgroundColor: colors.card,
                child: SafeArea(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                        child: Text(
                          l10n.appTitle,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      for (final destination in destinations)
                        ListTile(
                          title: Text(destination.label),
                          selected: _selected(path, destination.path),
                          selectedTileColor: colors.accentSoft,
                          onTap: () {
                            Navigator.of(context).pop();
                            context.go(destination.path);
                          },
                        ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: Text(l10n.languageLabel),
                        subtitle: Text(
                          PortfolioLanguages.name(
                            ref.watch(localeProvider)?.languageCode,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          ref.read(languagePromptProvider.notifier).open();
                        },
                      ),
                    ],
                  ),
                ),
              ),
        body: PointerField(
          child: Stack(
            children: [
              const Positioned.fill(child: _Atmosphere()),
              const Positioned.fill(child: CursorGlow()),
              const Positioned.fill(child: GrainOverlay()),
              Column(
                children: [
                  _TopBar(
                    wide: wide,
                    destinations: destinations,
                    currentPath: path,
                  ),
                  Expanded(child: child),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _selected(String current, String destination) {
    if (destination == '/') {
      return current == '/';
    }
    return current.startsWith(destination);
  }
}

class _Atmosphere extends StatelessWidget {
  const _Atmosphere();

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.lerp(colors.canvas, colors.accentSoft, 0.9)!,
            colors.canvas,
            Color.lerp(colors.canvas, colors.lamp, 0.14)!,
          ],
          stops: const [0, 0.52, 1],
        ),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _TopBar extends ConsumerWidget {
  const _TopBar({
    required this.wide,
    required this.destinations,
    required this.currentPath,
  });

  final bool wide;
  final List<({String path, String label})> destinations;
  final String currentPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final colors = context.portfolioColors;
    final themeMode = ref.watch(themeModeProvider);
    final languageCode = ref.watch(localeProvider)?.languageCode;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.canvas.withValues(alpha: 0.78),
            border: Border(bottom: BorderSide(color: colors.line)),
          ),
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: 74,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: wide ? 22 : 6),
                child: Row(
                  children: [
                    if (!wide)
                      IconButton(
                        tooltip: l10n.menuTooltip,
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(Icons.menu),
                      ),
                    _Mark(label: l10n.appTitle),
                    const Spacer(),
                    if (wide)
                      for (final destination in destinations)
                        _NavButton(
                          label: destination.label,
                          selected:
                              currentPath == destination.path ||
                              (destination.path != '/' &&
                                  currentPath.startsWith(destination.path)),
                          onPressed: () => context.go(destination.path),
                        ),
                    const SizedBox(width: 4),
                    IconButton(
                      tooltip: l10n.themeTooltip,
                      onPressed: () =>
                          ref.read(themeModeProvider.notifier).cycle(),
                      icon: Icon(_themeIcon(themeMode)),
                    ),
                    TextButton(
                      onPressed: () =>
                          ref.read(languagePromptProvider.notifier).open(),
                      child: Text(
                        PortfolioLanguages.codeLabel(languageCode),
                        style: TextStyle(
                          color: colors.ink,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData _themeIcon(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.system => Icons.brightness_auto,
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
    };
  }
}

class _Mark extends StatelessWidget {
  const _Mark({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    return TextButton(
      onPressed: () => context.go('/'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.ink,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Text(
              'IM',
              style: TextStyle(
                fontFamily: 'Fraunces',
                fontWeight: FontWeight.w600,
                color: colors.canvas,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700, color: colors.ink),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: selected ? colors.accentSoft : Colors.transparent,
          foregroundColor: selected ? colors.accent : colors.ink,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: selected ? colors.accent : colors.ink,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
