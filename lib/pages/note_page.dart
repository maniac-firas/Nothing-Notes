import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  String datetime;
  dynamic _controller;

  new({
      super.key,
      required this._controller, 
      required this.datetime,
  });

  Color cr = const Color.fromRGBO(219, 27, 38, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text(
              "My Notes",
              style: TextStyle(
                color: cr,
                fontSize: 26.0
              ),
            ),
            Expanded(child: Container()),
            Icon(Icons.undo, color: cr,), SizedBox(width: 10.0),
            Icon(Icons.redo, color: cr,), SizedBox(width: 10.0),
            Icon(Icons.ios_share_rounded, color: cr,), SizedBox(width: 40.0),
            Icon(Icons.more_horiz_rounded, color: cr,)
          ],
        ),
      ),
      body: Column(
        children: [
          Text(
            datetime,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[800]
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              _controller.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0
                ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 8.0),
                  border: InputBorder.none,
                  hintText: "Jot down your ideas...",
                ),
              ),
            ) 
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 47.0),
                Icon(Icons.checklist, color: cr), SizedBox(width: 47.0),
                Icon(Icons.link, color: cr), SizedBox(width: 47.0),
                Icon(Icons.draw, color: cr), SizedBox(width: 47.0),
                Icon(Icons.note_add, color: cr), SizedBox(width: 47.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}