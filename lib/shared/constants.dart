import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    // Border style when it is not focused
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    // Border style when it is focused
    borderSide: BorderSide(
      color: Colors.pink,
      width: 2.0,
    ),
  ),
);
