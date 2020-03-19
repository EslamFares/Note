import 'package:flutter/material.dart';
import 'Model/Notes.dart';
import 'UpdateNote.dart';

class ShowAllNotes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowAllNotesState();
  }
}

class ShowAllNotesState extends State<ShowAllNotes> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  List data = new List();

  void loadData() async {
    Notes().getData().then((result) {
      setState(() {
        data.addAll(result);
      });
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Show Notes',
            style: TextStyle(color: Colors.teal),
          ),
        ),
        body: showData());
  }

  Widget showData() {
    if (data != null && data.length > 0) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){
                      Notes().delete(id:data[index]['id']);
                      setState(() {
                        data.removeAt(index);
                      });
//OR
//                      Navigator.pushReplacement(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => ShowAllNotes()));
                    },
                  ),
              leading: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateNote(
                              data[index]['id'], data[index]['note'])));
                },
              ),
              title: Text('${data[index]['note']}'),
              onTap: () {
                //data[index]['id']
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateNote(
                            data[index]['id'], data[index]['note'])));
              },
            ));
          });
    } else if (data == null) {
      return Text('No Data At this time');
    }
  }
}
