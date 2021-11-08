import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  static const Color _activeBackgroundColor = Color(0xFF1D1E33);
  static const Color _inactiveBackgroundColor = Color(0xFF111328);

  final bool isActive;
  final Widget? child;
  final GestureTapCallback? onTap;

  InputCard({this.isActive = true, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: isActive ? _activeBackgroundColor : _inactiveBackgroundColor,
        ),
        child: child,
      ),
    );
  }
}
