class data{
  final int id;
  final String username;
  final String comment;

  data({this.id, this.username, this.comment});

  factory data.fromJson(Map<String, dynamic> json) {
    return data(
      //id: json['id'],
      username: json['username'],
      comment: json['comment'],
      );
  }

}