import 'dart:convert';
import 'package:fetching_data_from_the_internet_http/photo.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Use the compute function to run parsePhotos in a separate isolate.
  //return parsePhotos(response.body); instead of this
  //use this
  return compute(parsePhotos, response.body);
}

//As an alternate solution, check out the *worker_manager* or *workmanager* packages for background processing.