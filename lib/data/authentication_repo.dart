import 'package:iti_summer_course_tutorial/models/registeration.dart';
import 'package:iti_summer_course_tutorial/services/cache_handler.dart';
import 'package:iti_summer_course_tutorial/services/http_handler.dart';
import 'package:iti_summer_course_tutorial/utils/constants.dart';

class AuthenticationRepo {
  Future<AuthenticationResponse> registerNewUser(
      AuthenticationRequest request) async {
    Map registrationResponse =
        await HttpWrapper().httpPost("register", request.toJson());
    print("Registration response");
    print(registrationResponse);
    return AuthenticationResponse.fromJson(registrationResponse);
  }

  Future<AuthenticationResponse> login(AuthenticationRequest request) async {
    Map loginResponse = await HttpWrapper().httpPost("login", request.toJson());
    print("Registration response");
    print(loginResponse);
    AuthenticationResponse response =
        AuthenticationResponse.fromJson(loginResponse);
    await CacheHandler().setData(Constants.TOKEN_CACHE_KEY, response.token);
    //Cache login token
    return response;
  }
}
