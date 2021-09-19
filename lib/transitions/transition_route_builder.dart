import 'package:flutter/material.dart';

class TransitionRouteBuilder extends PageRouteBuilder {
  final Widget page;
  TransitionRouteBuilder(this.page): super(
    pageBuilder: (
      BuildContext context,
      Animation<double> primaryAnimation,
      Animation<double> secondaryAnimation
    ) => page,
    
    transitionsBuilder: (
      BuildContext context,
      Animation<double> primaryAnimation,
      Animation<double> secondaryAnimation,
      Widget child
    ) => SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset.zero
      ).animate(primaryAnimation),
      child: child
    ),
    transitionDuration: Duration(milliseconds: 560),
    reverseTransitionDuration: Duration(milliseconds: 560),
  );
}