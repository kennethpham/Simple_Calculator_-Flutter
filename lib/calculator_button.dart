import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final void Function() buttonHandler;
  const CalculatorButton(this.text, this.buttonHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text(text),
        onPressed: buttonHandler,
      )
    );
  }
}
