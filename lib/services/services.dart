import 'dart:core';
import 'dart:convert';
import 'package:appclases/exception/exception.dart';
import 'package:appclases/models/curses.dart';
import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';

class CoursesService {
  static const String _host = "https://api.sebastian.cl";
  static const String _apiTkn = "GRUPO-F-CPYD";
  static const String _apiKey = "d7b2bbc6393f49fdaf8be09ef652b44d";
  static const String _jsonMime = "application/json";

  Dio _dio = Dio(BaseOptions(baseUrl: _host));

  List<Curses> cursesFromJson(String str) =>
      List<Curses>.from(json.decode(str).map((x) => Curses.fromJson(x)));

  Future<List<Curses>> coursesData(String jwt) async {
    try {
      Response response = await _dio.get('/feeling/v1/voter/courses',
          options: Options(headers: {
            'accept': _jsonMime,
            'Content-Type': _jsonMime,
            'Authorization': 'Bearer $jwt',
          }));

      if (response.statusCode == 200) {
        var json = response.data;
        List<Curses> lista = cursesFromJson(json);
        return lista;
      }
    } catch (error) {
      print('Error: $error');
      throw ApiException('Error');
    }

    throw ApiException('Error');
  }
}