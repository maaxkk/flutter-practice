import 'package:flutter/cupertino.dart';

class AuthModel extends ChangeNotifier {
  final String? errorMessage;

  AuthModel();
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;
  const AuthProvider({
    super.key,
    required Widget child,
    required this.model,
  }) : super(child: child, notifier: model);

  static AuthProvider watch(BuildContext context) {
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
