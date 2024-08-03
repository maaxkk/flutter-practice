import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/data_providers/session_data_provider.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthInProgress = false;
  bool get isAuthInProgress => _isAuthInProgress;
  bool get canStartAuth => !_isAuthInProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Enter password and login';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthInProgress = true;
    notifyListeners();
    String? sessionId;
    try {
      sessionId = await _apiClient.auth(username: login, password: password);
    } catch (error) {
      _errorMessage = 'Incorrect password and email';
    }
    _isAuthInProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (sessionId == null) {
      _errorMessage = 'Unknown error, try again';
      notifyListeners();
      return;
    }

    _sessionDataProvider.setSessionId(sessionId);
    unawaited(Navigator.of(context).pushNamed('/main_screen'));
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;
  const AuthProvider({
    super.key,
    required Widget child,
    required this.model,
  }) : super(child: child, notifier: model);

  static AuthProvider? watch(BuildContext context) {
    final AuthProvider? result = context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    assert(result != null, 'No AuthProvider found in context');
    return result!;
  }

  static AuthProvider? read(BuildContext context) {
    final Widget? result = context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    assert(result != null, 'No widget found in context');
    return result is AuthProvider ? result : null;
  }
}
