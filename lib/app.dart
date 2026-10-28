import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:websiteportfilio/core/router/app_routes.dart';
import 'package:websiteportfilio/core/theme/app_theme.dart';
import 'package:websiteportfilio/features/shell/language_gate.dart';
import 'package:websiteportfilio/features/shell/portfolio_shell.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/providers/settings_providers.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(routes: $appRoutes, initialLocation: '/');
  ref.onDispose(router.dispose);
  return router;
});

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    final askLanguage = ref.watch(languagePromptProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) =>
          portfolioTabTitle(AppLocalizations.of(context), '/'),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      themeAnimationDuration: const Duration(milliseconds: 350),
      locale: locale ?? const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: router,
      builder: (context, child) {
        return Stack(children: [?child, if (askLanguage) const LanguageGate()]);
      },
    );
  }
}
