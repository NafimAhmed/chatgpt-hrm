import "dart:convert";

import "package:flutter/widgets.dart";
import "package:http/http.dart" as http;



class ChatGPTHandler {






  final List<Map<String, String>> messages = [];
  static const String OpenAiKey = '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';

  Future<String> chatGPTHandler(String prompt) async {



    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $OpenAiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages":  [
            {'role': 'user', 'content': "hello gpt"},
          ],
        }),
      );

      debugPrint("response from gpt....."+res.statusCode.toString());

      if (res.statusCode == 200) {
        debugPrint("response from gpt....."+res.body.toString());
        String content =
        jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  // String OpenAiKey='';
  //
  // Future<String> charGPTHandler (String messages) async {
  //
  //   var res = await http.post(
  //     Uri.parse('https://api.openai.com/v1/chat/completions'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $OpenAiKey',
  //     },
  //     body: jsonEncode({
  //       "model": "gpt-3.5-turbo",
  //       "messages": messages,
  //     }),
  //   );
  //
  //
  //
  //   return
  //
  // }

}