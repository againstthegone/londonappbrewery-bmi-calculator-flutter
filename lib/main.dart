import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  static get bodyText1 => null;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    final primaryColor = Color(0xFF0A0E21);
    final bodyTextColor = Color(0xFF8D8E98);
    final bodyTextFontSize = 18.0;

    return MaterialApp(
      home: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SliderTheme(
          child: InputPage(),
          data: SliderTheme.of(context).copyWith(
            thumbColor: Color(0xFFEB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            overlayColor: Color(0x15EB15555),
            activeTrackColor: Colors.white,
            inactiveTrackColor: Color(0xFF8D8E98),
          ),
        ),
      ),
      theme: theme.copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        colorScheme: theme.colorScheme.copyWith(
          primary: primaryColor,
          secondary: Colors.purple,
        ),
        iconTheme: theme.iconTheme.copyWith(
          color: Colors.white,
        ),
        textTheme: theme.textTheme.copyWith(
          bodyText1: theme.textTheme.bodyText1?.copyWith(
            color: bodyTextColor,
            fontSize: bodyTextFontSize,
          ),
          bodyText2: theme.textTheme.bodyText2?.copyWith(
            color: bodyTextColor,
            fontSize: bodyTextFontSize,
          ),
          headline3: theme.textTheme.headline3?.copyWith(
            color: bodyTextColor,
            fontSize: bodyTextFontSize,
          ),
        ),
      ),
    );
  }

  TextStyle copyWithBodyTextTheme(TextStyle style) {
    return style.copyWith(color: Colors.white);
  }
}
