import 'package:http/http.dart';

class Post {
  final String username;
  final String comment;

  Post({this.username, this.comment});

  factory Post.fromJson(Map <String, dynamic> json) {
    return Post(
      username: json['username'],
      comment: json['comment'],
    );
  }

  Map toMap(){
    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['comment'] = comment;

    return map;
  }

}