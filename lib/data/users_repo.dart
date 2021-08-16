import 'package:iti_summer_course_tutorial/models/registeration.dart';
import 'package:iti_summer_course_tutorial/models/user.dart';
import 'package:iti_summer_course_tutorial/models/user_update.dart';
import 'package:iti_summer_course_tutorial/services/http_handler.dart';

class UsersRepo {
  Future<List<User>> getUsers() async {
    HttpWrapper httpWrapper = new HttpWrapper();
    Map registrationResponse = await httpWrapper.httpGet("users");
    print("Users response");
    print(registrationResponse);
    Iterable usersIterable = registrationResponse['data'];
    List<User> usersList =
        usersIterable.map((item) => User.fromJson(item)).toList();
    return usersList;
  }

  Future<RegistrationResponse> registerNewUser(
      RegistrationRequest request) async {
    Map registrationResponse =
        await HttpWrapper().httpPost("register", request.toJson());
    print("Registration response");
    print(registrationResponse);
    return RegistrationResponse.fromJson(registrationResponse);
  }

  Future<UserUpdateModel> updateUser(
      int userId, UserUpdateModel request) async {
    HttpWrapper httpWrapper = new HttpWrapper();
    Map updateUserResponse =
        await httpWrapper.httpPut("users/$userId", request.toJson());
    UserUpdateModel response = UserUpdateModel.fromJson(updateUserResponse);
    return response;
  }
}
