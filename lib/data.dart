class Data{
  final int id;
  final String username;
  final String comment;

  Data({this.id, this.username, this.comment});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      //id: json['id'],
      username: json['username'],
      comment: json['comment'],
      );
  }

}