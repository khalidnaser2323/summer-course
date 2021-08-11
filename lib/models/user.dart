class User {
  int id;
  String email, firstName, lastName, image;
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.image,
  });
  factory User.fromJson(Map<String, dynamic> jsonObject) {
    return User(
      id: jsonObject['id'],
      email: jsonObject['email'],
      firstName: jsonObject['first_name'],
      lastName: jsonObject['last_name'],
      image: jsonObject['avatar'],
    );
  }
}
