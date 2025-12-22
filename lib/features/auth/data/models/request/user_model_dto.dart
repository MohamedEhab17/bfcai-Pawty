class UserModelDto {
  UserModelDto({
   
    this.userName,
    this.country,
    this.dateOfBirth,
    this.gender,
    this.imageUrl,
  });
 
  String? userName;
  String? dateOfBirth;
  String? gender;
  String? country;
  String? imageUrl;
  UserModelDto copyWith({
  
    String? userName,
    String? dateOfBirth,
    String? gender,
    String? country,
    String? imageUrl,
  }) {
    return UserModelDto(
      
      userName: userName ?? this.userName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'country': country,
      'imageUrl': imageUrl,
    };
  }
  static UserModelDto fromJson(Map<String, dynamic> json) {
    return UserModelDto(
     
      userName: json['userName'],
      dateOfBirth: json['dateOfBirth'],
      gender: json['gender'],
      country: json['country'],
      imageUrl: json['imageUrl'],
    );
  }         
}
