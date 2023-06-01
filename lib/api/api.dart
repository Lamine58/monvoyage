import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  
  static const String baseUrl = 'http://api.tagahvoyage.com';

  Future<dynamic> get(String endpoint,headers) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'),headers: headers);
    return json.decode(response.body);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {

    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    return json.decode(response.body);
  }
}
