import 'package:flutter/material.dart';

Widget LoginForm(){
  return TextFormField(
    cursorColor: Colors.white,
    style: const TextStyle(color: Colors.white),
    decoration: const InputDecoration(
      labelText: 'Логин',
      labelStyle: TextStyle(color: Colors.white),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );
}