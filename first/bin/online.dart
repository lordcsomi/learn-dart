// Question: Write a Dart program that fetches data from a public API (e.g., JSONPlaceholder) and prints out the titles of the first 5 posts. Use http package to make the API call.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    for (int i = 0; i < 5; i++) {
      print('Title: ${data[i]['title']}');
    }
    var jsonData = jsonEncode(data);
    var file = File('./output.json');
    await file.writeAsString(jsonData);
  } else {
    print('Failed to fetch data');
  }
}