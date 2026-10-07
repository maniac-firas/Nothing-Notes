import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nothing_notes/pages/note_page.dart';
import 'package:nothing_notes/util/database.dart';
import 'package:nothing_notes/util/to_note.dart';
import 'package:intl/intl.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _myBox = Hive.box('myBox');
  NotesDatabase db = NotesDatabase();

  Color cr = const Color.fromRGBO(219, 27, 38, 100);

  @override
  void initState() {
    if (_myBox.get("MetaData") == null) {
      db.initialCreateData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void addToNote() {
    setState(() {
      var foDt = DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());
      db.metaDataList.add([foDt, ""]);
      db.noteList.add([NotePage(datetime: foDt), ""]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 100.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Text(
            "My Notes",
            style: TextStyle(
              color: cr,
              fontSize: 30.0,
            ),
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: db.noteList.length,
        itemBuilder: (context, index) {
          return ToNote(
            db: db,
            i: index,
          );
        },
      ),

      floatingActionButton: SizedBox(
        width: 140,
        height: 50,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0.0,
          onPressed: addToNote,
          backgroundColor: cr,
          child: const Text(
            "+   Add Note",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: 'Calibri',
            ),
          ),
        ),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
    );
  }
}