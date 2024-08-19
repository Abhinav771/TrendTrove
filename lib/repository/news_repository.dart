import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';
//https://newsdata.io/api/1/latest?apikey=pub_500844253ca6f4c7ec6abaa4a4644b0b684d9&language=en
//https://newsdata.io/api/1/latest?apikey=pub_500844253ca6f4c7ec6abaa4a4644b0b684d9&language=en&image=1&removeduplicate=1
class NewsRepository {
  final String baseEndpoint = 'https://newsdata.io/api/1/latest?apikey=pub_500844253ca6f4c7ec6abaa4a4644b0b684d9&language=en&image=1&removeduplicate=1';
  String? nextPage;

  Future<List<NewsModel>> getNews({String? page}) async {
    final url = page != null ? '$baseEndpoint&page=$page' : baseEndpoint;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final List results = jsonResponse['results'];
      nextPage = jsonResponse['nextPage'];  // Update nextPage key

      return results.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
