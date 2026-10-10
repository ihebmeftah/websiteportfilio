import 'package:flutter/material.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/shared/widgets/pointer_field.dart';

class MagneticSurface extends StatefulWidget {
  const MagneticSurface({
    required this.child,
    super.key,
    this.borderRadius = const BorderRadius.all(Radius.circular(28)),
    this.color,
    this.padding = EdgeInsets.zero,
    this.onTap,
    this.depth = 1,
  });

  final Widget child;
  final BorderRadius borderRadius;
  final Color? color;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final double depth;

  @override
  State<MagneticSurface> createState() => _MagneticSurfaceState();
}

class _MagneticSurfaceState extends State<MagneticSurface> {
  final GlobalKey _boundsKey = GlobalKey();
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final signal = PointerField.of(context);
    final colors = context.portfolioColors;

    return ListenableBuilder(
      listenable: signal,
      builder: (context, _) {
        final light = _lightFor(signal, colors);

        final body = Stack(
          children: [
            Padding(padding: widget.padding, child: widget.child),
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: widget.borderRadius,
                    gradient: RadialGradient(
                      center: light.alignment,
                      radius: 1.15,
                      colors: [
                        Colors.white.withValues(alpha: light.glint),
                        Colors.white.withValues(alpha: 0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );

        return MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          cursor: widget.onTap == null
              ? MouseCursor.defer
              : SystemMouseCursors.click,
          child: TweenAnimationBuilder<double>(
            tween: Tween(end: _hovered ? -8 * widget.depth : 0),
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            builder: (context, lift, child) {
              return Transform.translate(offset: Offset(0, lift), child: child);
            },
            child: DecoratedBox(
              key: _boundsKey,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: colors.shadow.withValues(alpha: 0.08),
                    blurRadius: 18 * widget.depth + 6,
                    offset: Offset(0, 10 * widget.depth),
                  ),
                  BoxShadow(
                    color: light.color,
                    blurRadius: light.blur,
                    offset: light.offset,
                  ),
                ],
              ),
              child: Material(
                  color: widget.color ?? colors.card,
                  surfaceTintColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: widget.borderRadius,
                    side: BorderSide(
                      color: _hovered
                          ? colors.accent.withValues(alpha: 0.72)
                          : colors.line,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: widget.onTap == null
                      ? body
                      : InkWell(
                          onTap: widget.onTap,
                          customBorder: RoundedRectangleBorder(
                            borderRadius: widget.borderRadius,
                          ),
                          child: body,
                        ),
              ),
            ),
          ),
        );
      },
    );
  }

  _Light _lightFor(PointerSignal signal, PortfolioColors colors) {
    final depth = widget.depth;
    final rest = _Light(
      offset: Offset(0, 14 * depth),
      blur: 22 * depth + 8,
      color: colors.shadow.withValues(alpha: 0.16),
      alignment: const Alignment(-0.2, -0.8),
      glint: 0,
    );
    if (!signal.active) {
      return rest;
    }
    final box = _boundsKey.currentContext?.findRenderObject() as RenderBox?;
    final local = _local(box, signal.position);
    if (local == null) {
      return rest;
    }
    final size = box!.size;
    final center = Offset(size.width / 2, size.height / 2);
    final delta = local - center;
    final dist = delta.distance;
    if (dist < 0.5) {
      return rest;
    }
    final reach = 520.0;
    final influence = (1 - (dist / reach)).clamp(0.0, 1.0);
    final dir = delta / dist;
    return _Light(
      offset:
          Offset(-dir.dx, -dir.dy) * ((10 + 34 * influence) * depth) +
          Offset(0, 8 * (1 - influence) * depth),
      blur: (18 + 28 * influence) * (0.55 + depth * 0.45),
      color: colors.shadow.withValues(alpha: 0.12 + 0.38 * influence),
      alignment: Alignment(
        ((local.dx / size.width) * 2 - 1).clamp(-1.0, 1.0),
        ((local.dy / size.height) * 2 - 1).clamp(-1.0, 1.0),
      ),
      glint: influence * (_hovered ? 0.3 : 0.12),
    );
  }

  Offset? _local(RenderBox? box, Offset global) {
    if (box == null || !box.attached || !box.hasSize) {
      return null;
    }
    try {
      final size = box.size;
      if (size.width <= 0 || size.height <= 0) {
        return null;
      }
      return box.globalToLocal(global);
    } catch (_) {
      return null;
    }
  }
}

class _Light {
  const _Light({
    required this.offset,
    required this.blur,
    required this.color,
    required this.alignment,
    required this.glint,
  });

  final Offset offset;
  final double blur;
  final Color color;
  final Alignment alignment;
  final double glint;
}
