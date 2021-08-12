import 'package:flutter/cupertino.dart';

Route fadeTransitionRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      animation = CurvedAnimation(curve: Curves.easeOut, parent: animation);
      return FadeTransition(
        opacity:animation,
        child: child,
      );
    },
  );
}