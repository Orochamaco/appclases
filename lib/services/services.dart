import 'dart:core';
import 'dart:convert';
import 'package:appclases/exception/exception.dart';
import 'package:appclases/models/curses.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CoursesService{
  static const String _host = "https://api.sebastian.cl";
  static const String _apiTkn = "GRUPO-F-CPYD";
  static const String _apiKey = "d7b2bbc6393f49fdaf8be09ef652b44d";
  static const String _jsonMime = "application/json";

   List<Curses> cursesFromJson(String str) => List<Curses>.from(json.decode(str).map((x) => Curses.fromJson(x)));

   Future<List<Curses>> coursesData(String jwt) async {
    Uri url = Uri.parse(_host + '/feeling/v1/voter/courses');
    Map<String, String> headers = {
      'accept': _jsonMime,
      'Content-Type': _jsonMime,
      'Authorization': 'Bearer' + jwt,
  };
  final response = await http.get(url, headers: headers);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = response.body;
      List<Curses> lista = cursesFromJson(json);
      return lista;
    }
    else{
      throw ApiException('Error');
    }
  }
}