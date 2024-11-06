import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String clientId = '66510a795b71426b866cb4382fd59dc1';
const String clientSecret = 'b7aa41dc01c449c1b97daf51cd328a38';

class artist extends StatefulWidget {
  const artist({super.key});

  @override
  State<artist> createState() => _artistState();
}

class _artistState extends State<artist> {
  final TextEditingController _controller =
      TextEditingController(); // Controller for text input
  String? _artistInfo; // Holds artist information to be displayed
  List<String> _topTracks = []; // List of artist's top tracks
  bool _isLoading = false; // Shows loading indicator while fetching data

  // Function to obtain an access token from Spotify API
  Future<String?> _getSpotifyAccessToken() async {
    // Encode client credentials in base64 format
    final String credentials =
        base64Encode(utf8.encode('$clientId:$clientSecret'));

    // Make a POST request to get the access token
    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {
        'Authorization':
            'Basic $credentials', // Basic auth with base64-encoded credentials
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type':
            'client_credentials', // Requesting access via client credentials grant
      },
    );

    // Check if the token request was successful
    if (response.statusCode == 200) {
      // Parse the JSON response to get the access token
      final Map<String, dynamic> data = json.decode(response.body);
      return data['access_token']; // Return the token for subsequent requests
    } else {
      // If the request failed, print the status code for debugging
      print('Failed to get access token: ${response.statusCode}');
      return null;
    }
  }

  // Function to search for an artist and retrieve their top tracks
  Future<void> _searchArtist(String artistName) async {
    setState(() {
      _isLoading = true; // Show loading indicator
      _topTracks = []; // Clear previous tracks
    });

    // Obtain access token needed for authorized requests
    final accessToken = await _getSpotifyAccessToken();
    if (accessToken == null) return; // Exit if token retrieval failed

    // Make a GET request to search for the artist by name
    final artistResponse = await http.get(
      Uri.parse(
          'https://api.spotify.com/v1/search?q=$artistName&type=artist&limit=1'),
      headers: {
        'Authorization':
            'Bearer $accessToken', // Include access token in the header
      },
    );

    // Check if the artist search request was successful
    if (artistResponse.statusCode == 200) {
      // Parse the JSON response to get artist details
      final Map<String, dynamic> artistData = json.decode(artistResponse.body);
      if (artistData['artists']['items'].isNotEmpty) {
        // Get the first artist from the search results
        final artist = artistData['artists']['items'][0];
        final artistId =
            artist['id']; // Retrieve the artist's unique Spotify ID

        // Update artist information to display in the UI
        setState(() {
          _artistInfo = 'Artist: ${artist['name']}\n'
              'Followers: ${artist['followers']['total']}\n'
              'Genres: ${artist['genres'].join(', ')}\n'
              'Popularity: ${artist['popularity']}';
        });

        // Fetch the artist's top tracks using the retrieved artist ID
        await _getTopTracks(artistId, accessToken);
      } else {
        // No artist found; update UI to reflect this
        setState(() {
          _artistInfo = 'No artist found.';
        });
      }
    } else {
      // Print an error message if the artist search request failed
      print('Error fetching artist info: ${artistResponse.statusCode}');
    }

    // Hide loading indicator after data fetching is done
    setState(() {
      _isLoading = false;
    });
  }

  // Function to fetch an artist's top tracks using their artist ID
  Future<void> _getTopTracks(String artistId, String token) async {
    // Make a GET request to retrieve the artist's top tracks
    final topTracksResponse = await http.get(
      Uri.parse(
          'https://api.spotify.com/v1/artists/$artistId/top-tracks?market=US'),
      headers: {
        'Authorization':
            'Bearer $token', // Include access token for authorization
      },
    );

    // Check if the top tracks request was successful
    if (topTracksResponse.statusCode == 200) {
      // Parse the JSON response to get track details
      final Map<String, dynamic> data = json.decode(topTracksResponse.body);
      final List<dynamic> tracks = data['tracks'];

      // Update the top tracks list in the UI
      setState(() {
        _topTracks = tracks.map((track) => track['name'].toString()).toList();
      });
    } else {
      // Print an error message if the request failed
      print('Error fetching top tracks: ${topTracksResponse.statusCode}');
    }
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
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the UI elements
        child: Column(
          children: [
            // TextField for user to input artist name
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter artist name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Space between TextField and button

            // Search button to initiate artist search
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _searchArtist(
                      _controller.text); // Call search function with input name
                }
              },
              child: Text('Search'),
            ),
            SizedBox(height: 20), // Space between button and results

            // Show a loading indicator when data is being fetched
            if (_isLoading) CircularProgressIndicator(),

            // Display artist information if available
            if (_artistInfo != null)
              Text(
                _artistInfo!,
                textAlign: TextAlign.left,
              ),
            SizedBox(height: 20), // Space between artist info and tracks list

            // Display top tracks if available
            if (_topTracks.isNotEmpty) ...[
              Text('Top Tracks:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              for (var track in _topTracks)
                Text(track), // Show each track in the list
            ],
          ],
        ),
      ),
    );
  }
}
