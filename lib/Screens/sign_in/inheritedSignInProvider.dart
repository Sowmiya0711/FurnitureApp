import 'package:flutter/material.dart';

class InheritedSigninProvider extends InheritedWidget {
  const InheritedSigninProvider({Key key, Widget child, this.toggleView}) : super(key: key, child: child);
  final Function toggleView;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedSigninProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedSigninProvider>();
  }
}