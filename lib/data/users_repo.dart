import 'package:iti_summer_course_tutorial/models/user.dart';
import 'package:iti_summer_course_tutorial/services/http_handler.dart';

class UsersRepo {
  Future<List<User>> getUsers() async {
    Map usersResponse = await HttpWrapper().httpGet("users");
    print("Users response");
    print(usersResponse);
    Iterable usersIterable = usersResponse['data'];
    List<User> usersList =
        usersIterable.map((item) => User.fromJson(item)).toList();
    // List<User> usersList = [];
    // usersIterable.forEach((element) {
    //   usersList.add(User.fromJson(element));
    // });
    return usersList;
  }
}
