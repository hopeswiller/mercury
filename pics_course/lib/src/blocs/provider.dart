// INHERITED Widget

import 'package:flutter/material.dart';
import 'bloc.dart';

//providing an instance of bloc Class

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({Key key, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);

  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }

  @override
  bool updateShouldNotify(_) {
    return true;
  }
}
