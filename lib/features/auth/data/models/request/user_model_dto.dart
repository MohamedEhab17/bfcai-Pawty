class UserModelDto {
  UserModelDto({
    this.userName,
    this.country,
    this.dateOfBirth,
    this.gender,
    this.imageUrl,
    this.email,
    this.fullName,
    this.password,
  });

  String? userName;
  String? dateOfBirth;
  String? gender;
  String? country;
  String? imageUrl;
  String? email;
  String? fullName;
  String? password;

  UserModelDto copyWith({
    String? userName,
    String? dateOfBirth,
    String? gender,
    String? country,
    String? imageUrl,
    String? email,
    String? fullName,
    String? password,
  }) {
    return UserModelDto(
      userName: userName ?? this.userName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      imageUrl: imageUrl ?? this.imageUrl,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'userName': userName,
      'fullName': fullName,
      'imageUrl': imageUrl,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'country': country,
    };
  }

  factory UserModelDto.fromJson(Map<String, dynamic> json) {
    return UserModelDto(
      email: json['email'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      country: json['country'] as String?,
    );
  }
}
