import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Model/Notes.dart';
import 'package:notes/ShowAllNotes.dart';

class UpdateNote extends StatefulWidget {
  int id;
  String notedata;
  UpdateNote(this.id, this.notedata);
  @override
  State<StatefulWidget> createState() {
    return UpdateNoteState();
  }
}

class UpdateNoteState extends State<UpdateNote> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.done),onPressed: UpdateNotes,color: Colors.blue,)
          ],
          centerTitle: true,
          title: Text(
            'Update Notes',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: ListView(children: <Widget>[
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
                          initialValue: widget.notedata,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            counterText: 'Update Note  ',
                          ),
                          onSaved: (val) => notes = val,
                          // ignore: missing_return
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Please Enter data';
                            }
                          },
                        ),
                        OutlineButton(
                          shape: StadiumBorder(),
                          borderSide: BorderSide(color: Colors.blue,width: 3),
                          child: Text('Update Notes'),
                          onPressed: UpdateNotes,
                          color: Colors.amber,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]));
  }

  UpdateNotes() async {
    if (formState.currentState.validate()) {
      formState.currentState.save();
      // Notes().create();
      int add = await Notes().update(id: widget.id, note: notes);
      print('record update');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => ShowAllNotes()),
        ModalRoute.withName('/'),
      );
    }
  }
}
