import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getname() async{
  var response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
  var data = json.decode(response.body) as Map<String,dynamic>;
  return data["first_name"];
}