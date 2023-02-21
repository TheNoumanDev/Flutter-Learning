import 'package:fcsmadproject/views/DelayedAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:avatar_glow/avatar_glow.dart' show AvatarGlow;

import '../constants/routes.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return Scaffold(
      backgroundColor: Color(0xFF6CA8F1),
      body: Center(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 120.0,
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            AvatarGlow(
              endRadius: 90,
              duration: Duration(seconds: 2),
              glowColor: Colors.white24,
              repeat: true,
              repeatPauseDuration: Duration(seconds: 1),
              startDelay: Duration(seconds: 1),
              child: Material(
                  elevation: 8.0,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 50.0,
                    child:
                        Image.asset('assets/images/icon.png', fit: BoxFit.fill),
                  )),
            ),
            const SizedBox(
              height: 30.0,
            ),
            DelayedAnimation(
              child: Text(
                "Hi There",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 35.0, color: color),
              ),
              delay: delayedAmount + 1000,
            ),
            DelayedAnimation(
              child: Text(
                "I'm RichApp",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 35.0, color: color),
              ),
              delay: delayedAmount + 2000,
            ),
            SizedBox(
              height: 40.0,
            ),
            DelayedAnimation(
              child: Text(
                "WHERE YOU CAN",
                style: TextStyle(fontSize: 20.0, color: color),
              ),
              delay: delayedAmount + 3000,
            ),
            DelayedAnimation(
              child: Text(
                "BECOME RICHER THAN ME!!",
                style: TextStyle(fontSize: 20.0, color: color),
              ),
              delay: delayedAmount + 3000,
            ),
            SizedBox(
              height: 100.0,
            ),
            DelayedAnimation(
              child: GestureDetector(
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                child: Transform.scale(
                  scale: _scale,
                  child: _animatedButtonUI('Lets Get Started !'),
                ),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      registerViewRoute, (route) => false);
                },
              ),
              delay: delayedAmount + 4000,
            ),
            SizedBox(
              height: 50.0,
            ),
            // DelayedAnimation(
            //   child: Text(
            //     "ALready Registered? Click Me!".toUpperCase(),
            //     style: TextStyle(
            //         fontSize: 20.0,
            //         fontWeight: FontWeight.bold,
            //         color: color),
            //   ),
            //   delay: delayedAmount + 5000,
            // ),
          ],
        ),
      )
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //      Center(

          //   ),
          //   ],

          // ),
          ),
    );
  }

  Widget _animatedButtonUI(String r) => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            r,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6CA8F1),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
