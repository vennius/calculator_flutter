// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CalcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;
  final IconData icon;

  const CalcButton({
    super.key,
    this.text = "",
    required this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    required this.callback,
    this.icon = Icons.backspace,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback(text == "x" ? "*" : text);
      },
      child: Container(
        width: 81.75,
        height: 82,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Color(fillColor),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: text == ""
            ? Icon(
                icon,
                color: Colors.white,
                size: 32,
              )
            : Center(
                child: Text(
                  text,
                  style: GoogleFonts.workSans(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
      ),
    );
  }
}
