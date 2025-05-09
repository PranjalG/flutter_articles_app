import 'dart:convert';
import 'package:flutter_article_app/data/model/post_model.dart';
import 'package:http/http.dart' as http;

class LandingScreenDataProvider {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<PostModel>?> fetchPosts() async {
    final response = await http.get(Uri.parse('$_baseUrl/posts'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      return data.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
