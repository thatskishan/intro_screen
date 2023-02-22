import 'package:flutter/material.dart';
import 'package:intro_screen/utils/my_utils.dart';
import 'package:intro_screen/views/home_screen.dart';
import 'package:intro_screen/views/splash_three.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashTwo extends StatefulWidget {
  const SplashTwo({Key? key}) : super(key: key);

  @override
  State<SplashTwo> createState() => _SplashTwoState();
}

class _SplashTwoState extends State<SplashTwo> {
  checkSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool(sfSplashTwo) ?? false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SplashThree()));
    }
  }

  signUp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(sfSplashTwo, true);

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SplashThree()));
  }

  checkSkip() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool(sfSkip) ?? false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  isSkip() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(sfSkip, true);

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSignIn();
    checkSkip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Image.asset("Assets/Images/2.jpg"),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Intro Screen 2",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: signUp,
                  child: const Text("Next"),
                ),
                ElevatedButton(
                  onPressed: isSkip,
                  child: const Text("Skip"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
