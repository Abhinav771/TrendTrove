import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class CategoryRepo {
  final String _baseEndpoint = 'https://newsdata.io/api/1/latest?apikey=pub_500844253ca6f4c7ec6abaa4a4644b0b684d9&language=en&image=1&removeduplicate=1';

  Future<List<NewsModel>> getNews({String categories = ''}) async {
    final queryParam = categories.isNotEmpty ? '&category=$categories' : '';
    final url = '$_baseEndpoint$queryParam';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final List results = jsonResponse['results'];

      return results.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
