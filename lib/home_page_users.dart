import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'note.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> _notes = [];
  Future<List<Note>> fetchNotes() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    var response = await http.get(Uri.parse(url));

    List<Note> notes = [];
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }
  @override
  Widget build(BuildContext context) {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Пользователи'),

        // backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('img_1.png'),
              ),
              title: Text(_notes[index].title),
              subtitle: Text(_notes[index].text),
            ),
          );
        },
        itemCount: _notes.length,
      ),
    );
  }
}
