import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:myapp/Post.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

final inputtextField1  = TextEditingController();
final inputtextField2  = TextEditingController();
final CREATE_POST_URL = 'http://192.168.1.101/first/post.php';

class FirstRoute extends StatelessWidget {
  final Future<Post> post;

  const FirstRoute({Key key, this.post}) : super(key: key);
  

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
                controller: inputtextField1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username'
                ),
              ),
              ),
              Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: inputtextField2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Comment'
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(child: Text('Post'),
                      //onPressed: _postData,
                      onPressed: () async {
                          Navigator.pop(context);
                          Post newPost = new Post(username: inputtextField1.text, comment: inputtextField2.text);
                          Post p = await createPost(CREATE_POST_URL, body: newPost.toMap());
                      },
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
// void _postData() async{
//   Post newPost = new Post(username: inputtextField1.text, comment: inputtextField2.text);
//   Post p = await createPost(CREATE_POST_URL, body: newPost.toMap());
  
//   //print(p.username);
// }

// _makeRostRequest() async {
//   String url = "http://192.168.1.101/first/post.php";
//   Map<String, String> headers = {"Content-type": "application/json"};
//   //String json = '{"username" : "z", "comment" : "x"}';
//   Response response = await post(url, headers: headers, body: json);
//   int statusCode = response.statusCode;
//   String body = response.body;
// }

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
 
Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
 
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}
