import 'package:flutter/material.dart';
import 'weatherORartist.dart';

class signUp extends StatefulWidget {
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final _formKey = GlobalKey<FormState>();

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
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                      color: Color(0xff133E87),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // Add TextFormFields and ElevatedButton here.
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                      color: Color(0xff133E87),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                      color: Color(0xff133E87),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => weatherOrArtist()));
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data saved')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff133E87),
              ),
              child: const Text(
                'Sign up',
                style: TextStyle(
                  color: Color(0xffF3F3E0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
