import 'package:flutter/material.dart';
import 'Model/Notes.dart';
import 'ShowAllNotes.dart';
class AddNotes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddNotesState();
  }

}

class AddNotesState extends State<AddNotes>{
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.done),onPressed: addNotes,color: Colors.amber,)
        ],
        centerTitle: true,
        title: Text('Add Notes',style: TextStyle(color: Colors.amber),),
      ),
      body:
      ListView(children: <Widget>[
      Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Form(
              key: formState,
              child: Container(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      maxLines: null,
                      minLines: 20,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          counterText: 'Enter Notes',
                      ),
                      onSaved: (val)=> notes = val,
                      // ignore: missing_return
                      validator: (val){
                        if(val.isEmpty){
                          return 'Please Enter data';
                        }
                      },
                    ),
                    OutlineButton(
                      shape: StadiumBorder(),
                      borderSide: BorderSide(color: Colors.amber,width: 3),
                      child: Text('Add Notes',style: TextStyle(color: Colors.blue),),
                      onPressed: addNotes,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
  ])
    );
  }
  addNotes() async{
    if(formState.currentState.validate()){
      formState.currentState.save();
      // Notes().create();
      int add = await Notes().create({
        'note':'$notes'
      });
      print(add);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => ShowAllNotes()),
    ModalRoute.withName('/'));
    }
  }

}