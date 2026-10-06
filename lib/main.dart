import 'package:flutter/material.dart';
import 'package:nothing_notes/pages/notes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'NType 82',
        )
      ),
      home: NotesPage(),
    );
  }
}