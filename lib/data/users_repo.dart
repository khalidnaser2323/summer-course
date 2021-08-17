import 'package:iti_summer_course_tutorial/models/user.dart';
import 'package:iti_summer_course_tutorial/models/user_update.dart';
import 'package:iti_summer_course_tutorial/services/http_handler.dart';

class UsersRepo {
  String endPoint = "users";
  Future<List<User>> getUsers() async {
    HttpWrapper httpWrapper = new HttpWrapper();
    Map registrationResponse = await httpWrapper.httpGet(endPoint);
    print("Users response");
    print(registrationResponse);
    Iterable usersIterable = registrationResponse['data'];
    List<User> usersList =
        usersIterable.map((item) => User.fromJson(item)).toList();
    return usersList;
  }

  Future<UserUpdateModel> updateUser(
      int userId, UserUpdateModel request) async {
    HttpWrapper httpWrapper = new HttpWrapper();
    Map updateUserResponse =
        await httpWrapper.httpPut("$endPoint/$userId", request.toJson());
    UserUpdateModel response = UserUpdateModel.fromJson(updateUserResponse);
    return response;
  }
}
