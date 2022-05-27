import 'package:base_flutter/models/user.dart';
import 'package:base_flutter/network/response.dart';
import 'package:base_flutter/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class UserViewModel with ChangeNotifier {
  Response _response = Response.initial('Empty data');

  User? _user;

  Response get response {
    return _response;
  }

  User? get user {
    return _user;
  }

  /// Call the media service and gets the data of requested media data of
  /// an artist.
  Future<void> fetchUserData(String value) async {
    _response = Response.loading('Fetching user data');
    notifyListeners();
    try {
      List<User> userList = await UserRepository().fetchUserList(value);
      _response = Response.completed(userList);
    } catch (e) {
      _response = Response.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }
}
