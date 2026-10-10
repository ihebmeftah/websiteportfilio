import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw StateError('SharedPreferences must be overridden at startup.');
});

final themeModeProvider = NotifierProvider<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);

class ThemeModeController extends Notifier<ThemeMode> {
  static const _key = 'themeMode';

  @override
  ThemeMode build() {
    final stored = ref.watch(sharedPreferencesProvider).getString(_key);
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == stored,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> cycle() {
    final next = switch (state) {
      ThemeMode.system => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
    };
    return setMode(next);
  }

  Future<void> setMode(ThemeMode mode) async {
    state = mode;
    await ref.read(sharedPreferencesProvider).setString(_key, mode.name);
  }
}

final localeProvider = NotifierProvider<LocaleController, Locale?>(
  LocaleController.new,
);

class LocaleController extends Notifier<Locale?> {
  static const _key = 'locale';

  @override
  Locale? build() {
    final stored = ref.watch(sharedPreferencesProvider).getString(_key);
    if (stored != null && PortfolioLanguages.codes.contains(stored)) {
      return Locale(stored);
    }
    return null;
  }

  Future<void> setLocale(String languageCode) async {
    final next = Locale(languageCode);
    if (state != next) {
      state = next;
    }
    await ref.read(sharedPreferencesProvider).setString(_key, languageCode);
  }
}

final languagePromptProvider =
    NotifierProvider<LanguagePromptController, bool>(
      LanguagePromptController.new,
    );

class LanguagePromptController extends Notifier<bool> {
  @override
  bool build() => ref.watch(localeProvider) == null;

  void open() => state = true;

  void dismiss() {
    if (ref.read(localeProvider) != null) {
      state = false;
    }
  }
}

abstract final class PortfolioLanguages {
  static const codes = ['en', 'de', 'fr'];

  static String codeLabel(String? code) {
    return switch (code) {
      'de' => 'DE',
      'fr' => 'FR',
      _ => 'EN',
    };
  }

  static String name(String? code) {
    return switch (code) {
      'de' => 'Deutsch',
      'fr' => 'Français',
      _ => 'English',
    };
  }
}
