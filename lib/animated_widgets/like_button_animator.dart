import 'package:flutter/material.dart';
// import 'package:page_and_widget_animation/animated_widgets/like_button_animation.dart';
import 'package:page_and_widget_animation/pages/transitioned_page.dart';

class LikeButtonAnimator extends StatefulWidget {
  const LikeButtonAnimator({Key key}) : super(key: key);

  @override
  _LikeButtonAnimatorState createState() => _LikeButtonAnimatorState();
}

class _LikeButtonAnimatorState extends State<LikeButtonAnimator>
with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  
  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      vsync: this, duration: Duration(milliseconds: 200)
    );
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return TransitionedPage(controller);
  }
}