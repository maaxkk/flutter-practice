import 'package:ecoludeco/Theme/app_button_style.dart';
import 'package:ecoludeco/Theme/app_textfield_decor.dart';
import 'package:ecoludeco/Theme/theme_colors.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login to your account',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xffff9499),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 16.0, right: 16.0),
        child: ListView(
          children: [
            const _HeaderWidget(),
            const _FormWidget(),
          ],
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("In order to see all our products, as well as get personal "
            "recommendations you will need to login to your account. "
            "If you don't have an account, registering for an account "
            "is free and simple. Click here to get started"),
        ElevatedButton(
          onPressed: () {},
          style: AppButtonStyle.ordinaryButton,
          child: const Text('Register'),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("If you signed up but didn't get your verification email,"
            " click here to have it resent"),
        ElevatedButton(
          onPressed: () {},
          style: AppButtonStyle.ordinaryButton,
          child: const Text('Verify'),
        ),
      ],
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');
  String? errorText;

  void _login() {
    if (_loginController.text == 'admin' &&
        _passwordController.text == 'admin') {
      Navigator.of(context).pushNamed('/main_screen');
      errorText = null;
    } else {
      errorText = 'Username or password are incorrect';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(color: Colors.red, fontSize: 17),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
        const Text('Username'),
        const SizedBox(
          height: 5,
        ),
        TextField(
          decoration: TextFieldDecoration.ordinaryTextField,
          controller: _loginController,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Password'),
        const SizedBox(
          height: 5,
        ),
        TextField(
          decoration: TextFieldDecoration.ordinaryTextField,
          controller: _passwordController,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: _login,
              style: AppButtonStyle.ordinaryButton,
              child: const Text('Login'),
            ),
            const SizedBox(
              width: 25,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  foregroundColor:
                      WidgetStateProperty.all(ThemeColors.light.pinkColor)),
              child: const Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}
