import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:life_secundomer_app/model/note.dart';
import 'package:life_secundomer_app/pages/MainPages/StoriesPage/EditNotes.dart';

import '../../../db/notes_database.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({Key? key}) : super(key: key);

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  List<Note> notes = [];

  void initState() {
    super.initState();
    refreshNotes();
  }

  // void dispose() {
  //   NotesDatabase.instance.close();
  //   super.dispose();
  // }

  Future refreshNotes() async {
    this.notes = await NotesDatabase.instance.readAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Row(
          children: [
            Text(
              "Your Notes:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black),
            )
          ],
        ),
      ),
      body: Container(
        child: buildNotes(notes),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddEditNotePage(),
            ),
          );

          refreshNotes();
        },
      ),
    );
  }
}

Widget buildNotes(notes) {
  // final List<String> items = ['Hello', 'World', 'sdfsdf'];

  return ListView.builder(
    itemCount: notes.length,
    itemBuilder: (context, index) {
      return InkWell(
        onLongPress: () {
          // NotesDatabase.instance.delete(notes.noteId);
        },
        child: Card(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notes[index].title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${notes[index].createdTime.day.toString()}.${notes[index].createdTime.month.toString()}.${notes[index].createdTime.year.toString()} ",
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  notes[index].description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
