import 'package:flutter/material.dart';

class Headline3Text extends StatelessWidget {
  final String data;

  Headline3Text(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
