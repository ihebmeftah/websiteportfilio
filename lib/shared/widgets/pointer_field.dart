import 'package:flutter/widgets.dart';

class PointerSignal extends ChangeNotifier {
  Offset position = const Offset(-4000, -4000);
  bool active = false;

  void update(Offset next) {
    position = next;
    active = true;
    notifyListeners();
  }
}

class PointerField extends StatefulWidget {
  const PointerField({required this.child, super.key});

  final Widget child;

  static PointerSignal of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<_PointerScope>();
    assert(scope != null, 'PointerField is missing above this widget');
    return scope!.signal;
  }

  @override
  State<PointerField> createState() => _PointerFieldState();
}

class _PointerFieldState extends State<PointerField> {
  final PointerSignal signal = PointerSignal();

  @override
  void dispose() {
    signal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _PointerScope(
      signal: signal,
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (event) => signal.update(event.position),
        onPointerHover: (event) => signal.update(event.position),
        onPointerMove: (event) => signal.update(event.position),
        child: widget.child,
      ),
    );
  }
}

class _PointerScope extends InheritedWidget {
  const _PointerScope({required this.signal, required super.child});

  final PointerSignal signal;

  @override
  bool updateShouldNotify(_PointerScope oldWidget) => signal != oldWidget.signal;
}
