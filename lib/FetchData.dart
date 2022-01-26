import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/Strings.dart';
import 'package:untitled/models/product_entity.dart';
import 'package:http_status_code/http_status_code.dart';

import 'models/session.dart';

Future<List<ProductsEntity>> fetchProducts() async {
  final response = await http
      .get(Uri.parse('${STRINGS_ENUM.API_IP}:${STRINGS_ENUM.API_PORT}/products'));

  if (response.statusCode == StatusCode.OK) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => ProductsEntity.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

Future<Session> sendLogin(String username, String password) async {
  final response = await http
    .post(
    Uri.parse('${STRINGS_ENUM.API_IP}:${STRINGS_ENUM.API_PORT}/products'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  Session jsonResponse = json.decode(response.body);
  print(jsonResponse);
  return jsonResponse;
  // if (response.statusCode == StatusCode.OK) {
  // }
  // return new Object();
  // else {
  //   return
  // }
}