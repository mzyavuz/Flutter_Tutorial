import 'dart:convert'; //jsonDecode
import 'dart:io'; //HttpHeaders
import 'package:fetching_data_from_the_internet_http/album.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/2'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}