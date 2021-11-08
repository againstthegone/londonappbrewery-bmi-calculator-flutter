import 'dart:math';

import 'package:flutter/material.dart';

import 'calculator_button.dart';
import 'input_card.dart';

class ResultsPage extends StatelessWidget {
  final int height;
  final int weight;

  ResultsPage(this.height, this.weight);

  @override
  Widget build(BuildContext context) {
    double bmi = weight / pow(height / 100, 2);
    BmiCategory category = bmi > 25
        ? BmiCategory.OVERWEIGHT
        : bmi < 18.5
            ? BmiCategory.UNDERWEIGHT
            : BmiCategory.HEALTHY;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: InputCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    category.descriptor,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: category.color,
                    ),
                  ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 100.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    category.advice,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CalculatorButton(
            'RE-CALCULATE',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

enum BmiCategory {
  OVERWEIGHT,
  UNDERWEIGHT,
  HEALTHY,
}

extension BmiCategoryExtensions on BmiCategory {
  String get descriptor {
    switch (this) {
      case BmiCategory.OVERWEIGHT:
        return 'OVERWEIGHT';
      case BmiCategory.UNDERWEIGHT:
        return 'UNDERWEIGHT';
      default:
        return 'HEALTHY';
    }
  }

  String get advice {
    switch (this) {
      case BmiCategory.OVERWEIGHT:
        return 'You have a higher than healthy body weight. Try to exercise more.';
      case BmiCategory.UNDERWEIGHT:
        return 'You have a lower than healthy body weight. You can eat a bit more.';
      default:
        return 'You have a healthy body weight. Good job!';
    }
  }

  Color get color {
    switch (this) {
      case BmiCategory.OVERWEIGHT:
        return Color(0xFFD87224);
      case BmiCategory.UNDERWEIGHT:
        return Color(0xFF24C3D8);
      default:
        return Color(0xFF24D876);
    }
  }
}
