import 'package:flutter/material.dart';
import 'artist.dart';
import 'weather.dart';

class weatherOrArtist extends StatefulWidget {
  @override
  State<weatherOrArtist> createState() => _weatherOrArtistState();
}

class _weatherOrArtistState extends State<weatherOrArtist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3E0),
      appBar: AppBar(
        backgroundColor: Color(0xff608BC1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => artist()));
                },
                child: Center(
                  child: Text(
                    'Artist',
                    style: TextStyle(
                      color: Color(0xffF3F3E0),
                      fontSize: 40,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff133E87),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => Weather()));
                },
                child: Text(
                  'Weather',
                  style: TextStyle(
                    color: Color(0xffF3F3E0),
                    fontSize: 40,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff133E87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
