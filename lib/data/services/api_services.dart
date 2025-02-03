
import 'dart:convert';

import '../models/quote.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://zenquotes.io/api/quotes";

  Future<List<Quote>> fetchQuotes() async {

    try {
      final response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode == 200){
      List<dynamic>  data = json.decode(response.body);
      return data.map((json) => Quote.fromJson(json)).toList();
    }else {
      throw Exception('Failed to fetch quotes');
    }
    } catch (e) {
      throw Exception('Failed to fetch quotes');
    }
  }
}