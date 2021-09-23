import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: CupertinoColors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.pinkAccent,
      width: 2.0,
    ),
  ),
);
