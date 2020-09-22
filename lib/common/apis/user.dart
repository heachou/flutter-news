import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/http.dart';

class UserAPI {
  static Future<UserLoginResponseEntity> login(
      {UserLoginRequestEntity params}) async {
    var response = await HttpUtil().post('/user/login', params: params);
    return UserLoginResponseEntity.fromJson(response);
  }
}
