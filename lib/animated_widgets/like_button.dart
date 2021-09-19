import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  LikeButton(this.controller):
    colorOpacity = Tween<double>(
      begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 1.0, curve: Curves.bounceInOut)
      )
    ),
    heartColor = Tween<Color>(
      begin: Colors.blueGrey, end: Colors.pinkAccent
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0, curve: Curves.ease)
      )
    ),
    heartSize = Tween<double>(begin: 0.0, end: 40).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.555, 0.978, curve: Curves.easeIn)
      )
    )
    ;
  
  final AnimationController controller;
  final Animation<double> colorOpacity;
  final Animation<Color> heartColor;
  final Animation<double> heartSize;
  // final Animation<double> firstCircle;
  // final Animation<double> secondCircle;
  
  Widget buildButtonAnimation(BuildContext context, Widget child) {
    return Container(
      child: Center(
        child: Icon(
          Icons.favorite,
          size: heartSize.value,
          color: heartColor.value,
        )
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        builder: buildButtonAnimation,
        animation: controller,
      )
    );
  }
}