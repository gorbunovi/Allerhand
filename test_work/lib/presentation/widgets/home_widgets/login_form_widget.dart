import 'package:flutter/material.dart';

import '../../../services/focus_service.dart';

Widget LoginForm(BuildContext context, String login, FocusNode currentFocus, FocusNode nextFocus){
  return TextFormField(
    focusNode: currentFocus,
    autofocus: true,
    onFieldSubmitted: (_){
      fieldFocusChange(context, currentFocus, nextFocus);
    },
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
      validator: (val) {
        if (val!.isEmpty) {
          return 'Введите значение';
        }else if (val!= login){
          return 'Не верный логин';
        } else {
          null;
        }
      },
  );
}

