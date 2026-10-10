import 'package:flutter/material.dart';

@immutable
class PortfolioColors extends ThemeExtension<PortfolioColors> {
  const PortfolioColors({
    required this.canvas,
    required this.card,
    required this.ink,
    required this.muted,
    required this.line,
    required this.accent,
    required this.accentSoft,
    required this.lamp,
    required this.shadow,
  });

  final Color canvas;
  final Color card;
  final Color ink;
  final Color muted;
  final Color line;
  final Color accent;
  final Color accentSoft;
  final Color lamp;
  final Color shadow;

  static const light = PortfolioColors(
    canvas: Color(0xFFF3EFE6),
    card: Color(0xFFFFFCF8),
    ink: Color(0xFF1B1730),
    muted: Color(0xFF5C5670),
    line: Color(0xFFE3D8C8),
    accent: Color(0xFF4C3C8C),
    accentSoft: Color(0xFFE8E1F6),
    lamp: Color(0xFFE39A45),
    shadow: Color(0xFF241C40),
  );

  static const dark = PortfolioColors(
    canvas: Color(0xFF0C0B12),
    card: Color(0xFF17151F),
    ink: Color(0xFFF6F1E8),
    muted: Color(0xFFB3ABC4),
    line: Color(0xFF2E2938),
    accent: Color(0xFFCDBBFF),
    accentSoft: Color(0xFF2A2342),
    lamp: Color(0xFFF0B56B),
    shadow: Color(0xFF000000),
  );

  @override
  PortfolioColors copyWith({
    Color? canvas,
    Color? card,
    Color? ink,
    Color? muted,
    Color? line,
    Color? accent,
    Color? accentSoft,
    Color? lamp,
    Color? shadow,
  }) {
    return PortfolioColors(
      canvas: canvas ?? this.canvas,
      card: card ?? this.card,
      ink: ink ?? this.ink,
      muted: muted ?? this.muted,
      line: line ?? this.line,
      accent: accent ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      lamp: lamp ?? this.lamp,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  PortfolioColors lerp(ThemeExtension<PortfolioColors>? other, double t) {
    if (other is! PortfolioColors) {
      return this;
    }
    return PortfolioColors(
      canvas: Color.lerp(canvas, other.canvas, t)!,
      card: Color.lerp(card, other.card, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      line: Color.lerp(line, other.line, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      lamp: Color.lerp(lamp, other.lamp, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }
}

extension PortfolioColorsContext on BuildContext {
  PortfolioColors get portfolioColors =>
      Theme.of(this).extension<PortfolioColors>()!;
}
