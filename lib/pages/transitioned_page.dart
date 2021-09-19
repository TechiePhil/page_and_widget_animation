import 'package:flutter/material.dart';
import 'package:page_and_widget_animation/animated_widgets/like_button_animation.dart';
// import 'package:page_and_widget_animation/animated_widgets/like_button_animator.dart';

class TransitionedPage extends StatelessWidget {
  TransitionedPage(AnimationController controller):
    animation = LikeButtonAnimation(controller);
  
  final LikeButtonAnimation animation;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.deepOrangeAccent,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   )
      // ),
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: createAnimation
      ),
    );
  }
  
  Widget createAnimation(BuildContext context, Widget child) {
    return Center(
      child: Container(
        // height: 100,
        // width: 100,
        width: 30 + animation.wrapContainerSizeAnimation.value,
        height: 30 + animation.wrapContainerSizeAnimation.value,
        child: Container(
          decoration: BoxDecoration(
            color: animation.wrapContainerColorAnimation.value,
            borderRadius: BorderRadius.circular(150),
            border: Border.all(
              color: 
                animation.wrapContainerBorderColorAnimation.value,
              width: 
                animation.wrapContainerBorderWidthAnimation.value,
            )
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            child: Icon(
              Icons.favorite,
              color: animation.heartColorAnimation.value,
              size: animation.heartSizeAnimation.value,
              // size: 30,
              // color: Colors.pinkAccent
            ),
            onTap: () {
              animation.controller.addStatusListener(
                (AnimationStatus status) {
                if (status == AnimationStatus.completed) {}
              });
              animation.controller.forward(from: 0);
              // print('gesture!');
            }
          ),
        )
      )
    );
  }
}