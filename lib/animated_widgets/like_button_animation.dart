import 'package:flutter/material.dart';

class LikeButtonAnimation {
  LikeButtonAnimation(this.controller):
    wrapContainerSizeAnimation = Tween<double>(
      begin: 10.0, end: 70
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 1.0,
          curve: Curves.ease
        )
      )
    ),
    wrapContainerColorAnimation = TweenSequence<Color>(
      <TweenSequenceItem<Color>>[
        TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.transparent, end: Colors.pink
          ), 
          weight: 1.0
        ),
        TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.pink, end: Colors.purpleAccent[100]
          ),
          weight: 1.0
        ),
        TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.purpleAccent[100], end: Colors.blue[100]
          ),
          weight: 1.0
        ),
        TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.blue[100], end: Colors.transparent
          ),
          weight: 1.0
        ),
      ]
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, .8, curve: Curves.easeIn
        )
      )
    ),
    wrapContainerBorderWidthAnimation = Tween<double>(
      begin: 3.0, end: 0.0
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          .987, 1.0,
          curve: Curves.easeIn
        )
      )
    ),
    wrapContainerBorderColorAnimation = TweenSequence(
      <TweenSequenceItem<Color>>[
        TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.transparent, end: Colors.blue
          ), 
          weight: 1.0
        ),
        TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.blue, end: Colors.transparent
          ), 
          weight: 3.0
        )
      ]
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          .45, 1.0,
          curve: Curves.easeIn
        )
      )
    ),
    heartSizeAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 30.0, end: 15.0
          ),
          weight: 1.0
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 15.0, end: 0.0
          ),
          weight: 2.0
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.0, end: 30.0
          ),
          weight: 2.0
        ),
      ]
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 1.0,
          curve: Curves.linear
        )
      )
    ),
    heartColorAnimation = ColorTween(
      begin: Colors.blueGrey, end: Colors.pinkAccent
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 1.0, 
          curve: Curves.ease
        )
      )
    )
    ;
  
  
  final AnimationController controller;
  final Animation<double> wrapContainerSizeAnimation;
  final Animation<Color> wrapContainerColorAnimation;
  final Animation<double> wrapContainerBorderWidthAnimation;
  final Animation<Color> wrapContainerBorderColorAnimation;
  final Animation<double> heartSizeAnimation;
  final Animation<Color> heartColorAnimation;
}