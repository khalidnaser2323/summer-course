class AuthenticationRequest {
  String email, password;
  AuthenticationRequest({required this.email, required this.password});
  Map toJson() {
    Map<String, dynamic> json = {
      "email": this.email,
      "password": this.password
    };
    return json;
  }
}

class AuthenticationResponse {
  int? id;
  String token;
  AuthenticationResponse({this.id, required this.token});
  factory AuthenticationResponse.fromJson(Map json) {
    return AuthenticationResponse(id: json['id'], token: json['token']);
  }
}
