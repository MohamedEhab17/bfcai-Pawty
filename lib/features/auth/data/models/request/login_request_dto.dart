class LoginRequestDto {
  LoginRequestDto({ this.email,  this.password});
  String? email;
  String ?password;
    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}