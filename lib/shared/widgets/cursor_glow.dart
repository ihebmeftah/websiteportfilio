import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/shared/widgets/pointer_field.dart';

class CursorGlow extends StatefulWidget {
  const CursorGlow({super.key});

  @override
  State<CursorGlow> createState() => _CursorGlowState();
}

class _CursorGlowState extends State<CursorGlow>
    with SingleTickerProviderStateMixin {
  PointerSignal? _signal;
  Ticker? _ticker;
  Offset _light = const Offset(-800, -800);
  Offset _warm = const Offset(-800, -800);
  Offset _target = const Offset(-800, -800);
  bool _visible = false;
  bool _synced = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final next = PointerField.of(context);
    if (!identical(next, _signal)) {
      _signal?.removeListener(_onSignal);
      _signal = next;
      next.addListener(_onSignal);
    }
  }

  void _onSignal() {
    final signal = _signal;
    if (!mounted || signal == null || !signal.active) {
      return;
    }
    _target = signal.position;
    _visible = true;
    _ticker ??= createTicker(_tick)..start();
  }

  void _tick(Duration _) {
    if (!mounted) {
      return;
    }
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) {
      return;
    }
    final localTarget = box.globalToLocal(_target);
    if (!_synced) {
      _synced = true;
      setState(() {
        _light = localTarget;
        _warm = localTarget;
      });
      return;
    }
    final nextLight = Offset.lerp(_light, localTarget, 0.22)!;
    final nextWarm = Offset.lerp(_warm, localTarget, 0.08)!;
    if ((nextLight - _light).distance < 0.35 &&
        (nextWarm - _warm).distance < 0.35) {
      return;
    }
    setState(() {
      _light = nextLight;
      _warm = nextWarm;
    });
  }

  @override
  void dispose() {
    _signal?.removeListener(_onSignal);
    _ticker?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible) {
      return const SizedBox.expand();
    }
    final colors = context.portfolioColors;
    return IgnorePointer(
      child: Stack(
        children: [
          _orb(_warm, 720, colors.lamp.withValues(alpha: 0.16)),
          _orb(_light, 460, colors.accent.withValues(alpha: 0.2)),
          _orb(_light, 180, colors.lamp.withValues(alpha: 0.28)),
        ],
      ),
    );
  }

  Widget _orb(Offset center, double size, Color color) {
    return Positioned(
      left: center.dx - size / 2,
      top: center.dy - size / 2,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color, color.withValues(alpha: 0)],
          ),
        ),
      ),
    );
  }
}

class GrainOverlay extends StatelessWidget {
  const GrainOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return IgnorePointer(
      child: CustomPaint(
        painter: _GrainPainter(dark: dark),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _GrainPainter extends CustomPainter {
  _GrainPainter({required this.dark});

  final bool dark;
  static final Map<bool, ui.Picture> _cache = {};

  ui.Picture _tile() {
    return _cache.putIfAbsent(dark, () {
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      final paint = Paint()
        ..color = dark
            ? const Color(0xFFFFFFFF).withValues(alpha: 0.5)
            : const Color(0xFF2A2150).withValues(alpha: 0.55);
      final random = math.Random(4);
      for (var i = 0; i < 150; i++) {
        canvas.drawCircle(
          Offset(random.nextDouble() * 128, random.nextDouble() * 128),
          random.nextDouble() * 0.75 + 0.15,
          paint,
        );
      }
      return recorder.endRecording();
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    final tile = _tile();
    canvas.saveLayer(
      Offset.zero & size,
      Paint()..color = const Color.fromRGBO(255, 255, 255, 0.18),
    );
    for (var y = 0.0; y < size.height; y += 128) {
      for (var x = 0.0; x < size.width; x += 128) {
        canvas
          ..save()
          ..translate(x, y)
          ..drawPicture(tile)
          ..restore();
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_GrainPainter oldDelegate) => oldDelegate.dark != dark;
}
