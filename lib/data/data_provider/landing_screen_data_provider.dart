import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter_article_app/data/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

class LandingScreenDataProvider {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl/posts'))
          .timeout(const Duration(seconds: 10));

      switch (response.statusCode) {
        case 200:
          final List<dynamic> data = json.decode(response.body);
          return data.map((json) => PostModel.fromJson(json)).toList();

        case 404:
          throw ApiException('Data not found (404).');
        case 500:
          throw ApiException('Internal server error (500). Try again later.');
        case 401:
        case 403:
          throw ApiException('Unauthorized access.');
        default:
          throw ApiException('Unexpected error: ${response.statusCode}');
      }
    } on SocketException {
      throw ApiException('No internet connection.');
    } on TimeoutException {
      throw ApiException('Request timed out. Try again later.');
    } on FormatException {
      throw ApiException('Bad response format from server.');
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }
}