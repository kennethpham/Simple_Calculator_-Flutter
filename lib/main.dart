import 'package:flutter/material.dart';

import './calculator_button.dart';

void main() {
  runApp(const SimpleCalculator());
}

class SimpleCalculator extends StatelessWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SimpleCalculatorState(title: 'Simple Calculator'),
    );
  }
}

class SimpleCalculatorState extends StatefulWidget {
  const SimpleCalculatorState({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SimpleCalculatorState> createState() => _SimpleCalculatorStateState();
}

class _SimpleCalculatorStateState extends State<SimpleCalculatorState> {
  int _currTotal = 0;
  int _temp = 0;
  String? _currOperator;

  void numberClick(int num) {
    setState(() {
      if (_temp != 0) {
        _currTotal = 0;
      }
      _currTotal *= 10;
      _currTotal += num;
    });
  }
  void clearTotal() {
    setState(() {
      _currTotal = 0;
      _temp = 0;
    });
  }
  void operatorClick(String op) {
    setState(() {
      _temp = _currTotal;
      _currOperator = op;
    });
  }
  void equalsClick() {
    if (_currOperator != null) {
      setState(() {
        if (_currOperator == '+') {
          _currTotal += _temp;
        } else if (_currOperator == '-') {
          _currTotal = _temp - _currTotal;
        } else if (_currOperator == '*') {
          _currTotal *= _temp;
        } else if (_currOperator == '/') {
          _currTotal = _temp ~/ _currTotal;
        }
        _temp = 0;
        _currOperator = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          children: [
            Text(
              '$_currTotal',
              style: const TextStyle(fontSize: 30),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton('7', () => numberClick(7)),
                  CalculatorButton('8', () => numberClick(8)),
                  CalculatorButton('9', () => numberClick(9)),
                  CalculatorButton('/', () => operatorClick('/')),

                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton('4', () => numberClick(4)),
                  CalculatorButton('5', () => numberClick(5)),
                  CalculatorButton('6', () => numberClick(6)),
                  CalculatorButton('*', () => operatorClick('*')),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton('1', () => numberClick(1)),
                  CalculatorButton('2', () => numberClick(2)),
                  CalculatorButton('3', () => numberClick(3)),
                  CalculatorButton('-', () => operatorClick('-')),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton('0', () => numberClick(0)),
                  CalculatorButton('=', equalsClick),
                  CalculatorButton('+', () => operatorClick('+')),
                  CalculatorButton('C', clearTotal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
