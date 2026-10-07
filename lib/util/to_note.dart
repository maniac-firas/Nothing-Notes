import 'package:flutter/material.dart';
import 'package:nothing_notes/util/database.dart';

double sep = 15.0;

class ToNote extends StatelessWidget {
  final NotesDatabase db;
  int i;

  final _controller = TextEditingController();

  new({
    super.key,
    required this.db,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap:() {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => db.noteList[i][0],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top:20.0, right:20.0),
        child: Container(
          decoration: BoxDecoration(
            border: BoxBorder.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0)
          ),
          height: 60,
          child: Row(
            children: [
              SizedBox(width: sep),
              Icon(
                Icons.notes,
                color: Colors.white,
              ),
              SizedBox(width: sep),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 400-124,
                    height: 28.0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 8.0),
                          border: InputBorder.none,
                          hintText: "New Note",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    db.metaDataList[i][0],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}