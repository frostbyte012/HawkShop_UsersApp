import 'package:flutter/material.dart';

// methods
void changeScreen(BuildContext context, Widget widget){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
          widget));
}

void changeScreenReplacement (BuildContext context, Widget widget){
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
          widget));
}
