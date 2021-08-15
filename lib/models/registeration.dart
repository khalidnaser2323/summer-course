class RegistrationRequest {
  String email, password;
  RegistrationRequest({required this.email, required this.password});
  Map toJson() {
    Map<String, dynamic> json = {
      "email": this.email,
      "password": this.password
    };
    return json;
  }
}

class RegistrationResponse {
  int id;
  String token;
  RegistrationResponse({required this.id, required this.token});
  factory RegistrationResponse.fromJson(Map json) {
    return RegistrationResponse(id: json['id'], token: json['token']);
  }
}
