import 'package:flutter/material.dart';
import 'package:websiteportfilio/core/responsive/breakpoints.dart';

class PageFrame extends StatelessWidget {
  const PageFrame({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final wide = Breakpoints.isDesktop(context);
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1160),
        child: Padding(
          padding: EdgeInsets.fromLTRB(wide ? 40 : 20, wide ? 28 : 16, wide ? 40 : 20, 88),
          child: child,
        ),
      ),
    );
  }
}
