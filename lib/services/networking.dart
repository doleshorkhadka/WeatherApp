// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      print('Error fetching files from internet.');
      return Exception('No data');
    }
  }
}
