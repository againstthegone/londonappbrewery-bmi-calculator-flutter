import 'package:bmi_calculator/input_card.dart';
import 'package:bmi_calculator/input_card_icon.dart';
import 'package:bmi_calculator/style/input_counter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculator_button.dart';
import 'results_page.dart';
import 'style/number_text.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum InputGender { male, female }

class _InputPageState extends State<InputPage> {
  InputGender? activeGender;
  int height = 180;
  final weightCounter = InputCounter('WEIGHT', 66);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InputCard(
                    onTap: () {
                      setState(() {
                        activeGender = InputGender.male;
                      });
                    },
                    isActive: activeGender == InputGender.male,
                    child: InputCardIcon(
                        icon: FontAwesomeIcons.mars, text: 'MALE'),
                  ),
                ),
                Expanded(
                  child: InputCard(
                    onTap: () {
                      setState(() {
                        activeGender = InputGender.female;
                      });
                    },
                    isActive: activeGender == InputGender.female,
                    child: InputCardIcon(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: InputCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      NumberText(height),
                      Text('CM'),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InputCard(
                    child: weightCounter,
                  ),
                ),
                Expanded(
                  child: InputCard(
                    child: InputCounter('AGE', 24),
                  ),
                ),
              ],
            ),
          ),
          CalculatorButton(
            'CALCULATE',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ResultsPage(height, weightCounter.count)),
            ),
          ),
        ],
      ),
    );
  }
}
