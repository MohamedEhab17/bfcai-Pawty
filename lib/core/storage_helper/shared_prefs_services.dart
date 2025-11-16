// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPrefsServices {
//   static late SharedPreferences sharedPreferences;
//   static Future<void> sharedPreferencesInitialization() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }

//   static const String _rememberMeKey = "remember_me_data";

//   static Future<void> saveRememberMe(RemembermeModel data) async {
//     String jsonData = jsonEncode(data.toJson());
//     await sharedPreferences.setString(_rememberMeKey, jsonData);
//   }

//   static Future<RemembermeModel?> getRememberMe() async {
//     String? jsonData = sharedPreferences.getString(_rememberMeKey);
//     if (jsonData != null) {
//       return RemembermeModel.fromJson(jsonDecode(jsonData));
//     }
//     return null;
//   }

//   static Future<void> clearRememberMe() async {
//     await sharedPreferences.remove(_rememberMeKey);
//   }
// }