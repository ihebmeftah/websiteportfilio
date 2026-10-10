import 'package:flutter/material.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';

abstract final class AppTheme {
  static ThemeData light() => _build(Brightness.light, PortfolioColors.light);

  static ThemeData dark() => _build(Brightness.dark, PortfolioColors.dark);

  static ThemeData _build(Brightness brightness, PortfolioColors colors) {
    final scheme = ColorScheme.fromSeed(
      seedColor: colors.accent,
      brightness: brightness,
    ).copyWith(
      primary: colors.accent,
      onPrimary: brightness == Brightness.light
          ? Colors.white
          : const Color(0xFF1B1730),
      surface: colors.canvas,
      onSurface: colors.ink,
      onSurfaceVariant: colors.muted,
      outline: colors.line,
    );

    final base = ThemeData(
      useMaterial3: true,
      fontFamily: 'Outfit',
      colorScheme: scheme,
      scaffoldBackgroundColor: colors.canvas,
    );

    TextStyle fraunces(
      double size,
      FontWeight weight, {
      FontStyle style = FontStyle.normal,
      double height = 1,
      double letterSpacing = -0.6,
    }) {
      return TextStyle(
        fontFamily: 'Fraunces',
        fontSize: size,
        fontWeight: weight,
        fontStyle: style,
        height: height,
        letterSpacing: letterSpacing,
        color: colors.ink,
      );
    }

    return base.copyWith(
      extensions: [colors],
      textTheme: base.textTheme.copyWith(
        displayLarge: fraunces(68, FontWeight.w600, height: 0.92, letterSpacing: -2),
        displayMedium: fraunces(52, FontWeight.w600, height: 0.94, letterSpacing: -1.4),
        displaySmall: fraunces(40, FontWeight.w600, height: 1, letterSpacing: -1.1),
        headlineMedium: fraunces(32, FontWeight.w600, height: 1, letterSpacing: -0.8),
        headlineSmall: fraunces(
          26,
          FontWeight.w600,
          style: FontStyle.italic,
          height: 1.15,
          letterSpacing: -0.4,
        ),
        titleLarge: base.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          height: 1.2,
          color: colors.ink,
        ),
        titleMedium: base.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          height: 1.35,
          color: colors.ink,
        ),
        titleSmall: base.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: colors.ink,
        ),
        bodyLarge: base.textTheme.bodyLarge?.copyWith(
          fontSize: 16.5,
          height: 1.6,
          color: colors.ink,
        ),
        bodyMedium: base.textTheme.bodyMedium?.copyWith(
          fontSize: 14.5,
          height: 1.45,
          color: colors.ink,
        ),
        labelLarge: base.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 13,
          letterSpacing: 0.3,
          color: colors.ink,
        ),
      ),
      dividerColor: colors.line,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.accent,
          foregroundColor: scheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          textStyle: const TextStyle(
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(999)),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.ink,
          side: BorderSide(color: colors.ink.withValues(alpha: 0.28)),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          textStyle: const TextStyle(
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(999)),
          ),
        ),
      ),
    );
  }
}
