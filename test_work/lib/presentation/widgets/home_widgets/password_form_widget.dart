import 'package:flutter/material.dart';

import '../../../services/focus_service.dart';

Widget PasswordForm(BuildContext context, String password, FocusNode currentFocus, FocusNode nextFocus) {
  return TextFormField(
    focusNode: currentFocus,
    onFieldSubmitted: (_){
      fieldFocusChange(context, currentFocus, nextFocus);
    },
    cursorColor: Colors.white,
    style: const TextStyle(color: Colors.white),
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      labelText: 'Пароль',
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
      }else if (val!= password){
        return 'Не верный пароль';
      } else {
        null;
      }
    },
  );
}
