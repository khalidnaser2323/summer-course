import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iti_summer_course_tutorial/utils/constants.dart';

abstract class HttpWrapperInterface {
  Future<dynamic> httpGet(String endPoint);
  Future<dynamic> httpPost(String endPoint, Map request);
  Future<dynamic> httpPut(String endPoint, Map request);
}

class HttpWrapper implements HttpWrapperInterface {
  @override
  Future httpGet(String endPoint) async {
    Uri uri = Uri.parse(Constants.API_BASE + endPoint);
    http.Response response = await http.get(uri);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Somthing wrong happened, please try again later");
    }
  }

  @override
  Future httpPost(String endPoint, Map request) async {
    Uri uri = Uri.parse(Constants.API_BASE + endPoint);
    http.Response response =
        await http.post(uri, body: jsonEncode(request), headers: {
      'Content-Type': 'application/json',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      Map responseJson = jsonDecode(response.body);
      throw responseJson['error'];
    } else {
      throw Exception("Somthing wrong happened, please try again later");
    }
  }

  @override
  Future httpPut(String endPoint, Map request) async {
    Uri uri = Uri.parse(Constants.API_BASE + endPoint);
    http.Response response =
        await http.put(uri, body: jsonEncode(request), headers: {
      'Content-Type': 'application/json',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Somthing wrong happened, please try again later");
    }
  }
}
