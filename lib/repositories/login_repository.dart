import 'dart:convert';

import 'package:base_flutter/network/api.dart';
import 'package:base_flutter/network/enviroment.dart';

class LoginRepsitory {
  Enviroment enviroment = Api();

  Future<dynamic> doLogin(String email, String password) async {

    const String urlLogin = 'login';
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    dynamic response = await enviroment.postResponse(urlLogin, authData);

    print("RESPONSE");
    print(jsonDecode(response));

    return response;
  }
}