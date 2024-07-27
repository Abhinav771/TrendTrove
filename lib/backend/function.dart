import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/screens/homepage.dart';


// Future<List> fetchNews() async{
//     final response = await http.get(
//       Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=8d0cfc4b82ee41b6b0902401030ff5a8'+
//           '&q='+HomePage()._searchController.text ),
//
//     );
//     Map result=jsonDecode(response.body);
//     print('Fetched');
//     return (result['articles']);
//
// }