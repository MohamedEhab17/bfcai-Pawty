class RegisterRequestDto {
  RegisterRequestDto({ this.email,  this.password,
  this.confirmPassword,this.userName});
  String ?email;
  String ?password;
  String ?confirmPassword;
  String ?userName;
   Map<String, dynamic> toJson( ) {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['username'] = userName;
    data['email'] = email;
    data['password'] =password;
    data['confirmPassword'] =confirmPassword;
    return data;
  }
}
