import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/Theme/app_button_style.dart';
import 'package:themoviedb/widgets/auth/auth_model.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login to your account',
          style: TextStyle(color: Color.fromRGBO(232, 230, 227, 1.0)),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            'In order to use the editing and rating capabilities of TMDB, '
            'as well as get personal recommendations you will need to login'
            ' to your account. If you do not have an account, registering'
            ' for an account is free and simple. Click here to get started.',
            style: textStyle,
          ),
          ElevatedButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text('Register'),
          ),
          const SizedBox(height: 25),
          const Text(
            "If you signed up but didn't get your verification email, click here to have it resent.",
            style: textStyle,
          ),
          ElevatedButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text('Verify'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  _FormWidget({super.key});

  Future<void> auth(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xff212529),
    );
    const color = Color(0xff01b4e4);
    const textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff01b4e4), width: 2),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (model?.errorMessage != null) ...[
          _ErrorMessageWidget(errorMessage: model?.errorMessage),
        ],
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          decoration: textFieldDecorator,
          controller: model?.loginTextController,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          decoration: textFieldDecorator,
          obscureText: true,
          controller: model?.passwordTextController,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            _AuthButtonWidget(model: model, color: color),
            const SizedBox(
              width: 30,
            ),
            TextButton(
              onPressed: () {},
              style: AppButtonStyle.linkButton,
              child: const Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    super.key,
    required this.model,
    required this.color,
  });

  final AuthModel? model;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthInProgress == true
        ? const SizedBox(
            height: 15,
            width: 15,
            child: const CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text('Login');
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          )),
      child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({
    super.key,
    required String? errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.read(context)?.model.errorMessage;
    if (errorMessage == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 17,
        ),
      ),
    );
  }
}
