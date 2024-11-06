import 'package:flutter/material.dart';
import 'signin.dart';
import 'signup.dart';
import 'customwidget.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3E0),
      body: Center(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(
              height: 210,
            ),
            Column(
              children: [
                Container(
                  width: 400,
                  child: Text(
                    'Welcome to Weather&Music, where you can get information about your favorite artist and the weather in your area.',
                    style: TextStyle(
                        color: Color(0xff133E87),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 170,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (Context) => signUp()));
                  },
                  child: Text(
                    'Create an account',
                    style: TextStyle(
                      color: Color(0xffF3F3E0),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff133E87),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text('Already have an account? Sign in'),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (Context) => signIn()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
