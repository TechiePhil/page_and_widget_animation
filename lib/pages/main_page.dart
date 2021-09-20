import 'package:flutter/material.dart';
import 'package:page_and_widget_animation/animated_widgets/like_button_animator.dart';
import 'package:page_and_widget_animation/transitions/transition_route_builder.dart';
import 'dart:math' as math;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with 
SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotationAnimation;
  
  double height = 200;
  double width = 200;
  
  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      vsync: this, duration: Duration(seconds: 1)
    );
    rotationAnimation = Tween(
      begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller, curve: Curves.linear)
    );
    controller.addListener(() {
      setState(() {
        // angle = rotationAnimation.value;
      });
    });
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: (math.pi) * controller.value,
                  child: AnimatedContainer(
                    color: Colors.blue,
                    height: height,
                    width: width,
                    duration: controller.duration,
                  ),
                ),                
              ],
            ),
          ),
          Positioned(
            bottom: 70,
            left: 50,
            width: MediaQuery.of(context).size.width - 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  child: Text('Rotate Box'),
                  onPressed: () {
                    // rotate the box 360 degree
                    setState(() {
                      // height = 200;
                      // width = 200;
                    });
                    
                    controller.forward(from: 0);
                  }
                ),
                ElevatedButton(
                  child: Text(
                    height > 200 ? 'Scale Down Box' : 'Scale Up Box'
                  ),
                  onPressed: () {
                    if (
                      height == MediaQuery.of(context).size.height
                    ) {
                      // scale box to fill screen
                      height = 200;
                      width = 200;
                      
                      setState(() {
                      });
                    }
                    else {
                      // scale box to fill screen
                      height = MediaQuery.of(context).size.height;
                      width = MediaQuery.of(context).size.width;
                      setState(() {});
                    }
                  }
                )
              ]
            ),
          )
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Switch Page'),
        onPressed: ()=> Navigator.push(
          context,
          TransitionRouteBuilder(
            LikeButtonAnimator()
          )
        )
      )
    );
  }
}