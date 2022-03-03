import 'package:flutter/material.dart';
import 'package:test_work/pres/widgets/home_widgets/button_form_widget.dart';
import 'package:test_work/pres/widgets/home_widgets/password_form_widget.dart';
import 'package:test_work/pres/widgets/home_widgets/text_form_widget.dart';
import '../widgets/home_widgets/login_form_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const String _login = 'Vasya';
  static const String _password = '123';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color(0xff6657A1),
          padding: const EdgeInsets.all(15),
          child: Form(
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                TextForm(),
                const SizedBox(
                  height: 100,
                ),
                LoginForm(),
                const SizedBox(
                  height: 10,
                ),
                PasswordForm(),
                const SizedBox(
                  height: 100,
                ),
                ButtonForm(),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
