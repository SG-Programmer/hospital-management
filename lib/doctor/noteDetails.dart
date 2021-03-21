import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NoteDetails extends StatefulWidget {
  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  //FIrebase reference
  DatabaseReference _notes =
      FirebaseDatabase.instance.reference().child('notes');

  //Text Controller
  TextEditingController noteController = TextEditingController();

  Widget _widgetBuilder(var snap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.19,
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              _notes.child(snap.key).remove();
            },
          ),
        ],
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: Colors.black38,
                offset: Offset(0, 0),
                spreadRadius: 0.3)
          ]),
          padding: EdgeInsets.all(20),
          child: Text(
            snap.value['note'],
            style: TextStyle(fontSize: 16.6, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: Text(
              "All Notes",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.red[700],
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Container(
              child: FirebaseAnimatedList(
                query: _notes,
                itemBuilder: (BuildContext context, DataSnapshot snap,
                    Animation<double> animation, int index) {
                  var _data = snap;
                  return _widgetBuilder(_data);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              child: SimpleDialog(
                title: Text("Add Note"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autofocus: true,
                      controller: noteController,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            _notes.push().set(
                                {'note': noteController.text}).then((value) {
                              noteController.text = "";
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontSize: 17.5,
                                color: Colors.blue,
                                fontWeight: FontWeight.w400),
                          )))
                ],
              ));
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
