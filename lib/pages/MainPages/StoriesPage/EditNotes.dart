import 'package:flutter/material.dart';
import 'package:life_secundomer_app/model/note.dart';

import '../../../db/notes_database.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;

  const AddEditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  DateTime date = DateTime.now();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Create new note"),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please write some title...';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: _titleController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  controller: _descriptionController,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please write some title...';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black87),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final note = Note(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          createdTime: date);
                      await NotesDatabase.instance.create(note);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "CREATE",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      title: title,
      description: description,
    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title,
      description: description,
      createdTime: DateTime.now(),
    );

    await NotesDatabase.instance.create(note);
  }
}
