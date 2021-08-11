import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iti_summer_course_tutorial/utils/constants.dart';

abstract class HttpWrapperInterface {
  Future<dynamic> httpGet(String url);
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
}
