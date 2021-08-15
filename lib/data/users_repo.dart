import 'package:iti_summer_course_tutorial/models/registeration.dart';
import 'package:iti_summer_course_tutorial/models/user.dart';
import 'package:iti_summer_course_tutorial/services/http_handler.dart';

class UsersRepo {
  Future<List<User>> getUsers() async {
    Map registrationResponse = await HttpWrapper().httpGet("users");
    print("Users response");
    print(registrationResponse);
    Iterable usersIterable = registrationResponse['data'];
    List<User> usersList =
        usersIterable.map((item) => User.fromJson(item)).toList();
    // List<User> usersList = [];
    // usersIterable.forEach((element) {
    //   usersList.add(User.fromJson(element));
    // });
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
}
