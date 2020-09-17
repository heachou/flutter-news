import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/http.dart';

class UserAPI {
  static Future<UserResponseEntity> login({UserRequestEntity params}) async {
    var response = await HttpUtil().post('/user/login', params: params);
    return UserResponseEntity.fromJson(response);
  }
}
