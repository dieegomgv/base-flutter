
import 'package:base_flutter/network/api.dart';
import 'package:base_flutter/network/enviroment.dart';

import '../models/user.dart';

class UserRepository {
  Enviroment enviroment = Api();

  Future<List<User>> fetchUserList(String value) async {
    dynamic response = await enviroment.getResponse(value);
    final jsonData = response['results'] as List;
    List<User> userList = jsonData.map((tagJson) => User.fromJson(tagJson)).toList();
    return userList;
  }
}