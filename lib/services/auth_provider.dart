import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

class AuthProvider extends InheritedWidget {
  AuthProvider({required Widget child, required this.auth}) : super(child: child);
  final AuthBase auth;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AuthBase of(BuildContext context) {
    AuthProvider? provider = context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    return provider!.auth;
  }

}