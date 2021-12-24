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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SimpleCalculatorState> createState() => _SimpleCalculatorStateState();
}

class _SimpleCalculatorStateState extends State<SimpleCalculatorState> {
  int _currTotal = 0;

  void buttonClick() {
    setState(() {
      _currTotal = _currTotal + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                  CalculatorButton('7', buttonClick),
                  CalculatorButton('8', buttonClick),
                  CalculatorButton('9', buttonClick),
                  CalculatorButton('/', buttonClick),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton('4', buttonClick),
                  CalculatorButton('5', buttonClick),
                  CalculatorButton('6', buttonClick),
                  CalculatorButton('*', buttonClick),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton('1', buttonClick),
                  CalculatorButton('2', buttonClick),
                  CalculatorButton('3', buttonClick),
                  CalculatorButton('-', buttonClick),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton('0', buttonClick),
                  CalculatorButton('=', buttonClick),
                  CalculatorButton('+', buttonClick),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
