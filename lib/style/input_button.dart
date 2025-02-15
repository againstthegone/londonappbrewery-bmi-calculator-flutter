import 'package:flutter/material.dart';

class InputButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  InputButton(this.icon, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}
