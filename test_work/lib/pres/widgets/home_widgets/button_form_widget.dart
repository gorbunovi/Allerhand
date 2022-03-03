import 'package:flutter/material.dart';

Widget ButtonForm(){
  return ElevatedButton(
      style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(const Color(0xff333333))),
      onPressed: (){},
      child: const Text('Войти', style: TextStyle(color: Colors.white, fontSize: 21))
  );
}
