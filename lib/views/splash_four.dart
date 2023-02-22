import 'package:flutter/material.dart';
import 'package:intro_screen/utils/my_utils.dart';
import 'package:intro_screen/views/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashFour extends StatefulWidget {
  const SplashFour({Key? key}) : super(key: key);

  @override
  State<SplashFour> createState() => _SplashFourState();
}

class _SplashFourState extends State<SplashFour> {
  checkSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool(sfSplashFour) ?? false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  signUp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(sfSplashFour, true);

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Image.asset("Assets/Images/4.jpg"),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Intro Screen 4",
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
                  onPressed: () {
                    Navigator.of(context).pushNamed('home_page');
                  },
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
