import 'package:flutter/material.dart';
import 'package:websiteportfilio/features/stack/tech_catalog.dart';

class TechMark extends StatelessWidget {
  const TechMark({
    required this.color,
    required this.label,
    this.icon,
    this.letters,
    this.size = 48,
    super.key,
  });

  factory TechMark.fromTool(TechTool tool, {double size = 48, Key? key}) {
    return TechMark(
      key: key,
      color: tool.color,
      label: tool.name,
      icon: tool.icon,
      letters: tool.letters,
      size: size,
    );
  }

  final Color color;
  final String label;
  final IconData? icon;
  final String? letters;
  final double size;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final glyph = _glyph(color, dark);
    final wash = color.computeLuminance() < 0.05
        ? const Color(0xFF1B1730)
        : color;

    return ExcludeSemantics(
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: wash.withValues(alpha: dark ? 0.24 : 0.14),
          borderRadius: BorderRadius.circular(size * 0.3),
        ),
        child: icon != null
            ? Icon(icon, color: glyph, size: size * 0.52)
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: size * 0.08),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    letters ?? label,
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w700,
                      fontSize: size * 0.32,
                      letterSpacing: -0.4,
                      height: 1,
                      color: glyph,
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Color _glyph(Color brand, bool dark) {
    if (!dark) {
      return brand;
    }
    final luminance = brand.computeLuminance();
    if (luminance < 0.04) {
      return const Color(0xFFF6F1E8);
    }
    if (luminance < 0.22) {
      return Color.lerp(brand, Colors.white, 0.45)!;
    }
    return brand;
  }
}
