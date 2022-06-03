import 'dart:convert';
import 'dart:io';
import 'dart:io';

import 'package:base_flutter/network/enviroment.dart';
import 'package:base_flutter/network/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api extends Enviroment {
  final storage = const FlutterSecureStorage();

  @override
  Future getResponse(String url) async {
    final baseUrl = Uri.parse(API + url);
    final token = await storage.read(key: 'token') ?? '';
    var headers = <String, String>{};

    if (token.length > 1) {
      headers = <String, String>{
        HttpHeaders.authorizationHeader: 'Bearer $token',
        "Accept": "application/json"
      };
    } else{
      headers = <String, String>{
        "Accept": "application/json"
      };
    }

    dynamic responseJson;

    try {
      final response = await http.get(baseUrl, headers: headers);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future postResponse(String url, body) async {
    final baseUrl = Uri.parse(API + url);
    final token = await storage.read(key: 'token') ?? '';
    var headers = <String, String>{};

    print("ENTRA ALBVBB");
    print(baseUrl);

    if (token.length > 1) {
      headers = <String, String>{
        HttpHeaders.authorizationHeader: 'Bearer $token',
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "application/json"
      };
    } else{
      headers = <String, String>{
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "application/json"
      };
    }

    dynamic responseJson;
    try {
      print("ENTRA try");
      print(body);

      final response = await http.post(baseUrl, headers: headers, body: body);
      print("RESPONSE JSON 2222 => " + json.decode(response.body));

      responseJson = returnResponse(response);
    } on SocketException {
      print("ENTRA catch");

      throw FetchDataException('No Internet Connection');
    }

    print("RESPONSE JSON => " + responseJson);
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Ha ocurrido un error, inténtelo de nuevo' +
                ' código de error : ${response.statusCode}');
    }
  }
}