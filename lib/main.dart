import 'package:flutter/material.dart';
import 'package:news_app/controller/homescreencontroller/MyController.dart';
import 'package:news_app/view/mainscreens/splashscreen/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context) => My_Controller(),)
      ], 
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: My_Splash(),
        ),
      );
  }
}