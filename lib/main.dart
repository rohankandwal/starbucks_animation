import 'package:flutter/material.dart';
import 'package:starbuck_animation_redesign/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starbucks',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [HeroController()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
