//import 'package:appclases/services/voter.dart';
/*import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:convert';
import 'package:dio/dio.dart';
//import 'package:appclases/presentation/screens/authorization.dart';
import 'package:http/http.dart' as http;


class JwtProvider with ChangeNotifier {
  String _jwt = '';
  String get jwt => _jwt;
  String _token = '';

  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.sebastian.cl'));

  void setJwt(String jwt) {
    _jwt = jwt;
    notifyListeners();
  }

  Future<void> accJwt(String token) async {
    const String _apiTkn = 'GRUPO-F-CPYD';
    const String _apiKey = 'd7b2bbc6393f49fdaf8be09ef652b44d';

    _token = token;

    try {
      Response response = await _dio.post(
        '/UtemAuth/v1/tokens/$_token/jwt',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
            'X-API-TOKEN': _apiTkn,
            'X-API-KEY': _apiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        String jwt = response.data.toString();
        setJwt(jwt);
        //setJwt(response.data['jwt']);

      }
    } catch (error) {
      print('Error: $error');
    }
  }
   Future<void> getAndSetJwt(String token) async {
    await accJwt(token);
  }
}*/