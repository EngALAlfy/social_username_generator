import 'package:http/http.dart' as http;
import 'package:social_user_generator/utils/config.dart';

class ApiService {
  static ApiService? _instance;

  static ApiService get instance => _instance ??= ApiService._();

  ApiService._();

  String? apiSocialUsername;
  String? apiSocialPassword;

  init(){
    /// get data from api backend
    http.get(Config.baseApiUrl + "/settings.php");
  }
}