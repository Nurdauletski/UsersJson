import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'note.dart';
import 'json_fail.dart';

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
        elevation: 8,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.3),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Пользователи', style: TextStyle(color: Colors.black),),

        // backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            child: ListTile(
              contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 28,
                backgroundImage: AssetImage('img_1.png'),
              ),
              title: Text(_notes[index].title, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${_notes[index].text}', style: TextStyle(color: Color.fromRGBO(138, 138, 143, 1), fontSize: 13),),
                  Text('Surf', style: TextStyle(color: Colors.black, fontSize: 13),)
                ],
              )
            ),
          );
        },
        itemCount: _notes.length,
      ),
    );
  }
}
