import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: ItemDetail(),
  ));
}

class ItemDetail extends StatelessWidget {
  final List value;

  const ItemDetail({Key key, this.value}) : super(key: key);
  @override
  
  Widget build(BuildContext context) {

    //print(value[0]["id"]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
             Text("Username: " + value[0]["username"].toString(),
             style: new TextStyle(fontSize: 20.0),

             ),
             Text("Comment: " + value[0]["comment"].toString(),
             style: new TextStyle(fontSize: 20.0),
             )
          ],
        ),
      ),
    );
  }
  
}