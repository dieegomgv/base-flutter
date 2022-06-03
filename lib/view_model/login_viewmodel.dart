import 'package:base_flutter/network/response.dart';
import 'package:base_flutter/repositories/login_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier{
  Response _response = Response.initial('Empty data');

  Response get response {
    return _response;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email    = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading ( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> doLogin(String email, String password) async {
    _response = Response.loading('Iniciando sesión');
    notifyListeners();
    try {
      final dynamic response = await LoginRepsitory().doLogin(email, password);
      print("ENTRA AL TRY");
      _response = Response.completed(response.user);
    } catch (e) {
      print("ENTRA AL CATCH");
      _response = Response.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

}