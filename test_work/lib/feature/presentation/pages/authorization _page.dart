import 'package:flutter/material.dart';
import 'package:test_work/common/app_colors.dart';
import '../widgets/home_widgets/login_form_widget.dart';
import '../widgets/home_widgets/password_form_widget.dart';
import '../widgets/home_widgets/text_form_widget.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {

  static const String _login = 'login';
  static const String _password = '123';

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _loginFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _buttonFocus = FocusNode();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _loginFocus.dispose();
    _passwordFocus.dispose();
    _buttonFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: AppColors.backgroundColor,
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                TextForm(),
                const SizedBox(
                  height: 100,
                ),
                LoginForm(context, _login, _loginFocus, _passwordFocus),
                const SizedBox(
                  height: 10,
                ),
                PasswordForm(context, _password, _passwordFocus, _buttonFocus),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  focusNode: _buttonFocus,
                  style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(AppColors.buttonColor)),
                  onPressed: () => _submitForm(),
                  child: const Text('Войти', style: TextStyle(color: AppColors.textWhite, fontSize: 21))
                ),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void _submitForm(){
    if(_formKey.currentState!.validate()){
      Navigator.of(context).pushNamed('/CatalogPage');
    }
  }
}
