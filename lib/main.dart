import 'package:flutter/material.dart';
import 'dart:convert';
import 'database.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: LoadingPage(),
));

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading...'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getname(),
          builder: (context, snapshot){

            if(snapshot.hasData)
            {
              String? data = snapshot.data as String?;
              return Container(
               child: Text(data!),
              );
          }
            return Center(
             child: CircularProgressIndicator(),
        );
    }
    ),
      ),
    );
  }
}




