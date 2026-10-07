import 'package:hive_flutter/hive_flutter.dart';
import 'package:nothing_notes/pages/note_page.dart';

class NotesDatabase {
  List metaDataList = [];
  List noteList = [];

  final myBox = Hive.box('myBox');

  void initialCreateData(){
    metaDataList = [
      ["30/06/2026 00:04:59", ""],
    ];

    noteList = [
      [NotePage(datetime: metaDataList[0][0]), ""],
    ];
  }

  void loadData(){
    metaDataList = myBox.get("MetaData");
    noteList = myBox.get("Note");
  }

  void updateMetaData(){
    myBox.put("MetaData", metaDataList);
    myBox.put("Note", noteList);
  }


}