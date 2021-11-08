import 'package:flutter/material.dart';

import 'style/headline_3_text.dart';

class InputCardIcon extends StatelessWidget {
  final IconData? icon;
  final String text;

  InputCardIcon({@required this.icon, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Headline3Text(text),
      ],
    );
  }
}
