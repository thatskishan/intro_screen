import 'package:flutter/material.dart';
import 'package:intro_screen/views/home_screen.dart';
import 'package:intro_screen/views/spalsh_one.dart';
import 'package:intro_screen/views/splash_four.dart';
import 'package:intro_screen/views/splash_three.dart';
import 'package:intro_screen/views/splash_two.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    routes: {
      '/': (context) => const SplashOne(),
      'two': (context) => const SplashTwo(),
      'three': (context) => const SplashThree(),
      'four': (context) => const SplashFour(),
      'home_page': (context) => const HomePage(),
    },
  ));
}
