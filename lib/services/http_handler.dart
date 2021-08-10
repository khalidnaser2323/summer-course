import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class HttpHandler {
  Future<dynamic> httpGet(String url);
}

class MyHttpHandler implements HttpHandler {
  @override
  Future httpGet(String url) async {
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return jsonDecode(response.body);
  }
}
