import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Vladyslav';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 500,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(85, 0, 0, 0),
              blurRadius: 20,
              offset: Offset(2, 10),
            )
          ],
        ),
        child: SafeArea(
          minimum: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios),
                    Icon(Icons.keyboard_control)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "My Profile",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
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
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date of Birth:",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "01.10.2003",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Count of Notes:",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "73",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
