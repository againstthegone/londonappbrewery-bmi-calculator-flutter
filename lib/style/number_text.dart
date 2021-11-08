import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberText extends StatelessWidget {
  final int number;

  NumberText(this.number);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$number',
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 50,
        color: Colors.white,
      ),
    );
  }
}
