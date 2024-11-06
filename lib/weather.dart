import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'ab9e57a62c22ca42d1412d7ec0b984c5';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  double long = 0;
  double lat = 0;
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    long - location.longitude;
    getData();
  }

  void getData() async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'lat': '$lat', 'lon': '$long', 'appid': apiKey});
    var response = await http.get(url);
    var data = response.body;
    if (response.statusCode == 200) {
      var condition = jsonDecode(data)['weather'][0]['id'];
      var temp = jsonDecode(data)['main']['temp'];
      var cityName = jsonDecode(data)['name'];

      print(condition);
      print(temp);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  // ignore: must_call_super
  void initState() {
    // TODO: implement initState
    getLocation();
  }

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
                  getLocation();
                  getData();
                },
                child: Center(
                  child: Text(
                    'Get location',
                    style: TextStyle(
                      color: Color(0xffF3F3E0),
                      fontSize: 20,
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
        ],
      ),
    );
  }
}
