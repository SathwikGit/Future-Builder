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

  Widget _loadedScreen(String name){
    return
      Container(

        child: Card(
          color: Colors.redAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name,
    style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
    ),),
          ),
        ),
      );
  }

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
            Widget retVal;
            String? data = snapshot.data as String?;
            if(snapshot.hasData && snapshot.connectionState == ConnectionState.done)
            {
              retVal = _loadedScreen("$data");
            }
            else {
             retVal = const CircularProgressIndicator();
            }
            return retVal;
          },
        ),
      )
    );
  }
}

// Important Notes->
// builder : It should Compulsory have a return type Function.
// type 'Null' is not a subtype of type 'String' in type cast to escape this error use nullable String?



