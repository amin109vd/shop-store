import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 2,
        ))
      ..forward();
    animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3), () => print('timer'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset('assets/images/image6.jpg',width: 200,),
            ),
          ),Center(child: Image.asset('assets/images/image6.jpg',width: 200,),)
        ],
      ),
    );
  }
}
