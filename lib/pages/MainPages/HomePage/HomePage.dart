import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:life_secundomer_app/utils/UserSimplePrefernces.dart';
import 'dart:async';

import '../../../db/notes_database.dart';
import '../../../model/note.dart';

import 'package:age_calculator/age_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];
  int daysOfBirth = 0;
  bool isHaveDateBirthday = false;
  DateTime date = DateTime.now();

  initBirthday() {
    // print('1');
    bool check = UserSimplePreferences.checkBirthday();
    // print('14');
    if (check) {
      // print('check True');
      isHaveDateBirthday = true;
    } else {
      // print('check False');
      isHaveDateBirthday = false;
    }

    // print('2');
  }

  void initState() {
    super.initState();
    refreshNotes();
    initBirthday();
    date = UserSimplePreferences.getBirthday();
    daysOfBirth = AgeCalculator.age(date).days;
    print(daysOfBirth);
  }

  Future refreshNotes() async {
    this.notes = await NotesDatabase.instance.readAllNotes();
    setState(() {});
  }

  int CountOfNotes = 0;

  // int different = DateTime.now().difference(date).inSeconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Your age:",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              isHaveDateBirthday
                  ? Text(
                      "${AgeCalculator.age(date)}",
                      style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    )
                  : Text(
                      'I am Sorry',
                      style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Left for the birthday:",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "38",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Days"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "23",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Hours"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "47",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Minutes"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "26",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Seconds"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your latest stories:",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              ShowNotes(notes),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ShowNotes(notes) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    primary: false,
    shrinkWrap: true,
    itemCount: notes.length,
    itemBuilder: (context, index) {
      return SingleChildScrollView(
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
