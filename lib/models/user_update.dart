class UserUpdateModel {
  String name, job;
  String? updatedAt;
  UserUpdateModel({required this.name, required this.job, this.updatedAt});
  Map toJson() {
    Map json = {};
    json['name'] = this.name;
    json['job'] = this.job;
    return json;
  }

  factory UserUpdateModel.fromJson(Map json) {
    return UserUpdateModel(
      name: json['name'],
      job: json['job'],
      updatedAt: json['updatedAt'],
    );
  }
}
