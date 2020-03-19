import 'package:flutter/material.dart';
import './AddNotes.dart';
import './ShowAllNotes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note',
      theme: ThemeData.dark(),
//    home: MyHomePage(),
      home: MyHomePage(title: 'My Note'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
//        title: Text('My Note'),
        title: Row(
          children: <Widget>[
            Text(widget.title,
                style: TextStyle(color: Colors.teal, fontSize: 25.0)),
            Icon(Icons.event_note, color: Colors.teal)
          ],
        ),

//        Text(
//          widget.title,
//          style: TextStyle(color: Colors.teal, fontSize: 25.0),
//        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[Icon(Icons.add), Text("New Note")],
              ),
              textColor: Colors.white,
              color: Colors.amber,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNotes()));
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            FlatButton(
              child: Row(
                children: <Widget>[
                  Text("Show All Notes "),
                  Icon(Icons.playlist_add_check)
                ],
              ),
              textColor: Colors.white,
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowAllNotes()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
            Text(
            'Welcom Back ',
              style: TextStyle(color: Colors.blueAccent,fontSize: 15),
            ),
//                  Icon(Icons.copyright,size: 15.0,),
//                  Text(' E.fares     ')
              ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 3.0)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotes()));
        },
        tooltip: 'Add New Note',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
