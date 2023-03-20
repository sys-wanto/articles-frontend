import 'dart:convert';
import 'dart:html';

import 'package:articles/app/modules/home/articles_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ArticlesApi {
  // ArticlesApi._();
  static const String baseUrl = "localhost:8000";
  static const String urigetAllArticles = baseUrl;
  // final dio = Dio();
  Future<Articles> getAllArticles(int limit, int offset) async {
    var url = Uri.http(baseUrl, '/articles/$limit/$offset/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Articles.fromJson(jsonDecode(response.body));
    } else {
      List<String> errMsg = ["Server Offline"];
      return Articles(isError: true, data: null, messages: errMsg);
    }
    // dio.options.headers['Access-Control-Allow-Origin'] = "*";
    // dio.options.headers['Access-Control-Allow-Methods'] = "GET";
    // dio.options.headers['Content-Type'] = 'application/json; charset-UTF-8';
    // final response = await dio.get('$urigetAllArticles/$limit/$offset/');
    // return Articles.fromJson(response.data);
  }
}
