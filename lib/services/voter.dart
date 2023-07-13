import 'dart:core';
//import 'dart:convert';
import 'package:appclases/presentation/screens/authorization.dart';
import 'package:dio/dio.dart';
//import 'package:appclases/providers/jwt_provider.dart';
//import 'package:provider/provider.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoterService {
  static const String _host = "https://api.sebastian.cl";
  static const String _apiTkn = "GRUPO-F-CPYD";
  static const String _apiKey = "d7b2bbc6393f49fdaf8be09ef652b44d";
  static const String _jsonMime = "application/json";
  static const String _jwtKey = 'jwt'; // Agrega esta constante

  static Future<bool> login(BuildContext context) async {
    Uri url = Uri.parse(_host + "/UtemAuth/v1/tokens/login");
    Map<String, String> headers = {
      'accept': _jsonMime,
      'Content-Type': _jsonMime,
      'X-API-TOKEN': _apiTkn,
      'X-API-KEY': _apiKey
    };

    try {
      Response response =
          await Dio().get(url.toString(), options: Options(headers: headers));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        final responseJson = response.data;
        final String redirect = responseJson['redirectUrl'];
        final String token = responseJson['token'];
        if (redirect.isNotEmpty) {
          // Guardar el JWT en SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(_jwtKey, token);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthorizationScreen(
                url: redirect,
                token: token,
              ),
            ),
          );
        }
      }
    } catch (error) {
      print('Error: $error');
    }

    return true;
  }

  static Future<String?> getJwt(String token) async {
    Uri url = Uri.parse(_host + '/UtemAuth/v1/tokens/' + token + '/jwt');
    Map<String, String> headers = {
      'accept': _jsonMime,
      'Content-Type': _jsonMime,
      'X-API-TOKEN': _apiTkn,
      'X-API-KEY': _apiKey
    };

    try {
      Response response =
          await Dio().post(url.toString(), options: Options(headers: headers));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        var responseJson = response.data;
        String jwt = responseJson['jwt'];
        return jwt;
      }
    } catch (error) {
      print('Error: $error');
    }

    return null;
  }

  static Future<String?> getSavedJwt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_jwtKey);
  }
}