
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myapp/data.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: HomePage(),
  ));
}



class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("http://192.168.0.119/first/get.php"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
    
    print(data[1]["title"]);
    
    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Text(data[index]["comment"]),
            //child: new Text(data[index]["username"])
          );
        },
      ),
    );
  }
}
