import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/utils/config.dart';
import 'package:social_user_generator/utils/extensions.dart';

class ApiService {
  static ApiService? _instance;

  static ApiService get instance => _instance ??= ApiService._();

  ApiService._();

  String? apiSocialUsername;
  String? apiSocialPassword;

  Future init() async {
      Map<String , dynamic>? data = await callApi("settings.php?secret=${Config.apiSecret}");
      if(data?.isNotEmptyOrNull == true){
        if(data!.containsKey("api_username")){
         apiSocialUsername = data["api_username"];
        }

        if(data.containsKey("api_password")){
         apiSocialPassword = data["api_password"];
        }
      }
  }

  bool get canVerify => !apiSocialUsername.isEmptyOrNull && !apiSocialPassword.isEmptyOrNull;

  Future<dynamic> callApi(String url) async {
    try{
      /// get data from api backend
      http.Response response = await _callUrl("${Config.baseApiUrl}/$url");
      if(response.statusCode.isSuccessful()){
        Map<String , dynamic> body = jsonDecode(response.body);
        if(body.containsKey("success") && body["success"] == true){
          return body["data"];
        }
      }
    }catch(e){
      debugPrint(e.toString());
    }

    return null;
  }

  Future<dynamic> _callUrl(String url)async{
    http.Response response = await http.get(Uri.parse(url) , headers: {"accept":"application/json"});
    return response;
  }

  Future<Map<String , bool>> confirmUsername(String service , String username) async {
    try{
      /// get data from api backend
      http.Response response = await _callUrl("https://checkmarks.com/api/v1/username/$username/account/$apiSocialUsername/password/$apiSocialPassword");
      if(response.statusCode.isSuccessful()){
        dynamic body = jsonDecode(response.body);
        if(body is List){
          bool isAvailable = body.any((element) => element["website"] == service && element["status"] > 0);
          return {username:isAvailable};
        }
      }
    }catch(e){
      debugPrint(e.toString());
    }

    return {username:false};
  }
}