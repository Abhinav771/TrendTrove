import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';

import '../utils/next_page.dart';
//https://newsdata.io/api/1/latest?apikey=pub_500844253ca6f4c7ec6abaa4a4644b0b684d9&language=en
//https://newsdata.io/api/1/latest?apikey=pub_500844253ca6f4c7ec6abaa4a4644b0b684d9&language=en&image=1&removeduplicate=1
NewsNextPage newsNextPage=NewsNextPage();
class LoadNewsRepository {


  String endpoint='https://newsdata.io/api/1/latest?apikey=pub_500844253ca6f4c7ec6abaa4a4644b0b684d9&language=en&image=1&removeduplicate=1&page=$newsNextPage.nextPage';
  Future<List<NewsModel>> getNews() async{
    Response response=await get(Uri.parse(endpoint));
    if(response.statusCode==200){

      final List result=jsonDecode(response.body)['results'];
      final String nextPage=jsonDecode(response.body)['nextPage'];
      print(response.body);
      newsNextPage.nextPage=nextPage;

      return result.map(((e)=>NewsModel.fromJson(e))).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }


}
