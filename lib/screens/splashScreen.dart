import 'package:flutter/material.dart';

import 'loginAndRegisterScreen/dart/Login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? Key}) : super(key: Key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);

    fadedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
    navigateToHome();
  }

  void dispose() {
    controller.dispose();
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 4), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff69b7cf), Color(0xff3be6bc)])),
        child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return Center(
                child: Transform(
                    transform: Matrix4.identity(),
                    alignment: Alignment.center,
                    child: Container(
                      child: FadeTransition(
                          opacity: fadedAnimation,
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                            size: 150,
                          )
                          //Image.network(
                          //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtCfTlXYtqZBkcbGcZCHdbWefWp-IweMuhxQ&usqp=CAU'),
                          ),
                    )),
              );
            }));
  }
}
