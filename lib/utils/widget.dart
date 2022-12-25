import 'package:flutter/material.dart';

Widget roundTextButton(Text text,
    {double padding = 5.0,
      Color backgroundColor = Colors.transparent,
      Color borderSideColor = Colors.transparent,
      Color shadowColor = Colors.white,
      double elevation = 0.0,
      double borderRadius = 0.0,
      Function()? onPressed}) {
  return Container(
    height: 56,
    child: TextButton(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: text,
      ),
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(color: borderSideColor),
      ),
      onPressed: onPressed,
    ),
  );
}