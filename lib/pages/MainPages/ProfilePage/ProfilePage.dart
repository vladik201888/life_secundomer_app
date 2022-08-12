import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:life_secundomer_app/utils/UserSimplePrefernces.dart';
import 'package:sqflite/sqflite.dart';

import '../../../db/notes_database.dart';
import '../../../model/note.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  DateTime? date = UserSimplePreferences.getBirthday();

  String yorDateOfBirth =
      UserSimplePreferences.getBirthday().toString().substring(0, 10);

  void initState() {
    super.initState();
    name = UserSimplePreferences.getUsername() ?? '';
    refreshNotes();
  }

  List<Note> notes = [];
  int countOfNotes = 0;

  Future refreshNotes() async {
    this.notes = await NotesDatabase.instance.readAllNotes();
    setState(() {});
    countOfNotes = notes.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Profile:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black),
              ),
              InkWell(
                onTap: () async {
                  UserSimplePreferences.setUsername('');
                  setState(() {
                    this.name = "";
                  });
                },
                child: Icon(
                  Icons.keyboard_control,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            height: 400,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(85, 0, 0, 0),
                  blurRadius: 20,
                  offset: Offset(2, 10),
                )
              ],
            ),
            child: SafeArea(
              minimum: const EdgeInsets.all(18),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(121, 0, 140, 255),
                            blurRadius: 20,
                            offset: Offset(2, 10),
                          )
                        ],
                      ),
                      child: ProfilePicture(
                        name: 'Aditya Dharmawan Saputra',
                        radius: 50,
                        fontsize: 50,
                        img:
                            'https://zipmex.com/static/d1af016df3c4adadee8d863e54e82331/Twitter-NFT-profile.jpg',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$name",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date of Birth:",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "$yorDateOfBirth",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Count of Notes:",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "$countOfNotes",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]))
      ],
    ));
  }
}
