import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tutorials/api_key.dart';

Future<String> getOpenRouterResponse(String userInput) async {
  const endpoint = 'https://openrouter.ai/api/v1/chat/completions';

  final headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json'
  };

  final body = jsonEncode({
    'model': 'anthropic/claude-sonnet-4',
    'messages': [
      {'role': 'user', 'content': userInput}
    ],
    'max_tokens': 500,
    'temperature': 0.7,
  });

  try {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      // print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to get response: ${response.body}');
    }
  } catch (e) {
    // print('Exception: $e');
    throw Exception('Network error: $e');
  }
}
