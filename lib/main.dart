// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_app/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _history = "";
  String _expression = "";

  void addExpression(String text) {
    setState(() {
      _expression += text;
    });
  }

  void clearAll(String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }

  void clearExpression(String text) {
    setState(() {
      _expression = "";
    });
  }

  void erase(String text) {
    setState(() {
      _expression = _expression.substring(0, _expression.length - 1);
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
    setState(() {
      _history = _expression;
      _expression = eval % 1 == 0 ? eval.toInt().toString() : eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff17171C),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _history,
                          style: GoogleFonts.workSans(
                            color: Color(0xff747477),
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        AutoSizeText(
                          _expression,
                          maxLines: 1,
                          style: GoogleFonts.workSans(
                            color: Colors.white,
                            fontSize: 96,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: "C",
                        fillColor: 0xff4E505F,
                        callback: clearExpression,
                      ),
                      CalcButton(
                        text: "AC",
                        fillColor: 0xff4E505F,
                        callback: clearAll,
                      ),
                      CalcButton(
                        text: "^",
                        fillColor: 0xff4E505F,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "/",
                        fillColor: 0xff4B5EFC,
                        callback: addExpression,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: "7",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "8",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "9",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "x",
                        fillColor: 0xff4B5EFC,
                        callback: addExpression,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: "4",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "5",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "6",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "-",
                        fillColor: 0xff4B5EFC,
                        callback: addExpression,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: "1",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "2",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "3",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "+",
                        fillColor: 0xff4B5EFC,
                        callback: addExpression,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: ".",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        text: "0",
                        fillColor: 0xff2E2F38,
                        callback: addExpression,
                      ),
                      CalcButton(
                        fillColor: 0xff2E2F38,
                        callback: erase,
                        icon: Icons.backspace_outlined,
                      ),
                      CalcButton(
                        text: "=",
                        fillColor: 0xff4B5EFC,
                        callback: evaluate,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
