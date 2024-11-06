import 'package:flutter/material.dart';
import 'weatherORartist.dart';

class signIn extends StatefulWidget {
  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3E0),
      appBar: AppBar(
        backgroundColor: Color(0xff608BC1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'Weather&Music',
                style: TextStyle(
                  color: Color(0xffF3F3E0),
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Email'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _EmailController,
              decoration: const InputDecoration(
                  hintText: 'Enter Your Email', border: OutlineInputBorder()),
            ),
          ),
          Text('Password'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _PasswordController,
              decoration: const InputDecoration(
                  hintText: 'Enter Your Password',
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (Context) => weatherOrArtist()));
            },
            child: Text(
              'Sign in',
              style: TextStyle(
                color: Color(0xffF3F3E0),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff133E87),
            ),
          )
        ],
      ),
    );
  }
}
