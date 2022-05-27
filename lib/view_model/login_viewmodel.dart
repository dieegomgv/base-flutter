import 'package:base_flutter/network/response.dart';
import 'package:base_flutter/repositories/login_repository.dart';
import 'package:base_flutter/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier{
  Response _response = Response.initial('Empty data');

  Response get response {
    return _response;
  }

  Future<void> doLogin(String email, String password) async {
    _response = Response.loading('Fetching artist data');
    notifyListeners();
    try {
      //List<User> userList = await UserRepository().fetchUserList(value);
      final dynamic response = await LoginRepsitory().doLogin(email, password)
      _response = Response.completed(response.user);
    } catch (e) {
      _response = Response.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

}