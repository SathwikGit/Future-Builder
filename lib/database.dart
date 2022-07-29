import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future getname() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
  var data;
  if(response.statusCode == 200){
    data = jsonDecode(response.body);
  }else{
    Text('error');
  }
  print(response.statusCode);
  print(data["data"]["first_name"]);

  return Future.delayed(Duration(seconds: 2)).then((value) => data["data"]["first_name"]);
}
