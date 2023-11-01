import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/view/mainscreens/homescreen/home_screen.dart';

class My_Splash extends StatefulWidget {
  const My_Splash({super.key});

  @override
  State<My_Splash> createState() => _My_SplashState();
}

class _My_SplashState extends State<My_Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home_page(),
        )));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie_splash.json"),
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: Text("NEWS 2DAY",style: TextStyle(fontSize: 60,fontWeight: FontWeight.w900,color: Color.fromRGBO(8, 20, 68, 1)),),
          )
        ],
      ),
    );
  }
}
