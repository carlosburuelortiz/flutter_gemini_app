import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiImpl {
  final Dio _http = Dio(
    BaseOptions(baseUrl: dotenv.env['ENPOPOINT_API'] ?? ''),
  );

  Future<String> getReponse(String prompt) async {
    try {
      final body = jsonEncode({'prompt': prompt});
      final response = await _http.post('/basic-prompt', data: body);

      return response.data;
    } catch (e) {
      throw Exception("Can't get Gemini response");
    }
  }
}
