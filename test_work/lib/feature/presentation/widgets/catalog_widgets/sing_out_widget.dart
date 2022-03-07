
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget SingOut(BuildContext context){
  return GestureDetector(
    onTap: () => Navigator.of(context).pushNamed('/'),
    child: Center(
      child: Row(
        children: [
          const Text(
            'Выйти',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            'assets/images/sing_out.svg',
            height: 20,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(width: 10),
        ],
      ),
    ),
  );
}