import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:social_user_generator/utils/config.dart';

class ApiService {
  static ApiService? _instance;

  static ApiService get instance => _instance ??= ApiService._();

  ApiService._();

  String? apiSocialUsername;
  String? apiSocialPassword;

  init() async {

  }

  Future<dynamic> callApi(String url) async {
    try{
      /// get data from api backend
      http.Response response = await http.get(Uri.parse("${Config.baseApiUrl}/$url"));
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
}