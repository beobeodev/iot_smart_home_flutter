import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:iot_smart_home/core/constants/key_env.dart';
import 'package:iot_smart_home/core/utils/http/exceptions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class HttpProvider {
  static Future<T> get<T>(String url) async {
    try {
      final String endpoint = '${dotenv.env[KeyEnv.apiUrl]}$url';
      final http.Response response = await http.get(Uri.parse(endpoint));
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  static Future<T> post<T>(String url, Map<String, dynamic> formBody) async {
    try {
      final String endpoint = '${dotenv.env['API_URL']}$url';
      final Map<String, String> header = {
        'Content-Type': 'application/json',
      };
      final http.Response response = await http.post(Uri.parse(endpoint),
          body: jsonEncode(formBody), headers: header);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  static Future<T> patch<T>(String url, Map<String, dynamic> formBody) async {
    try {
      final String endpoint = '${dotenv.env['API_URL']}$url}';
      final http.Response response =
          await http.patch(Uri.parse(endpoint), body: formBody);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  static T _returnResponse<T>(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal server error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
