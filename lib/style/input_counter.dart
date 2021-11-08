import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'input_button.dart';
import 'number_text.dart';

class InputCounter extends StatefulWidget {
  final String title;
  final int startingCount;
  late final _InputCounterState _state;

  InputCounter(this.title, this.startingCount);

  @override
  _InputCounterState createState() =>
      _state = _InputCounterState(startingCount, title);

  get count => _state.count;
}

class _InputCounterState extends State<InputCounter> {
  String title;
  int count;

  _InputCounterState(this.count, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        NumberText(count),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputButton(
              FontAwesomeIcons.minus,
              onPressed: () {
                setState(() {
                  count--;
                });
              },
            ),
            SizedBox(width: 10.0),
            InputButton(
              FontAwesomeIcons.plus,
              onPressed: () {
                setState(() {
                  count++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
