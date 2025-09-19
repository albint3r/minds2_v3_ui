// lib/core/presentation/design_system/atoms/ds_logo_animated.dart
import "dart:math" as math;
import "package:flutter/material.dart";
import "package:minds2_ui_v3/gen/assets.gen.dart";

class DSLogoAnimated extends StatefulWidget {
  const DSLogoAnimated({
    super.key,
    this.onToggle,
    this.tooltip,
    this.size = 35,
    this.initialExpanded = true,
  });

  final VoidCallback? onToggle;
  final String? tooltip;
  final double size;
  final bool initialExpanded;

  @override
  State<DSLogoAnimated> createState() => _DSLogoAnimatedState();
}

class _DSLogoAnimatedState extends State<DSLogoAnimated> {
  late bool _expanded;
  double _turns = 0; // contador acumulado de vueltas

  @override
  void initState() {
    super.initState();
    _expanded = widget.initialExpanded;
  }

  void _handleTap() {
    setState(() {
      _expanded = !_expanded;
      _turns += _expanded ? 1 : -1; // horario o antihorario
    });
    widget.onToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Tooltip(
        message: widget.tooltip ?? "",
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: _turns),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return Transform.rotate(
              angle: value * 2 * math.pi,
              child: child,
            );
          },
          child: Assets.images.logo.minds2LogoSymbol.image(
            height: widget.size,
          ),
        ),
      ),
    );
  }
}
