import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}




class FirstRoute extends StatelessWidget {
TextEditingController inputtextField  = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    //_makeRostRequest();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("First Route"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: inputtextField,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username'
                ),
              ),
              ),
              Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: inputtextField,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Comment'
                ),
              ),
              )
          ],
          ),
        
        //child: 
        // RaisedButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Text('Go back main page'),
        // ),
      ),
    );
  }
}

_makeRostRequest() async {
  String url = "http://192.168.1.101/first/post.php";
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"username" : "z", "comment" : "x"}';
  Response response = await post(url, headers: headers, body: json);
  int statusCode = response.statusCode;
  String body = response.body;
}

// Future<http.Response> postRequest() async {
//   var url = "http://192.168.1.101/first/post.php";
//   Map data = {
//     'usernamne' : '123',
//     'comment' : '234'
//   };
//   var body = json.encode(data);
//   var response = await http.post(url, headers: {"Content-Type": "application/json"}, body: body);
//   return response;
// }
 

