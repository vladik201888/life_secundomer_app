import 'package:flutter/material.dart';
import 'package:life_secundomer_app/utils/UserSimplePrefernces.dart';

class AgePage extends StatefulWidget {
  const AgePage({Key? key}) : super(key: key);

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  DateTime date = DateTime.now();
  void initState() {
    super.initState();
    // date = UserSimplePreferences.getBirthday() ? UserSimplePreferences.getBirthday() : DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
        ),
        margin: EdgeInsets.only(top: 450),
        height: 500,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            // Введите вашу  дату рождения
            Text(
              "Choose your date of birth:",
              style: TextStyle(
                  fontSize: 32,
                  color: Color.fromARGB(214, 0, 0, 0),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50,
            ),
            // Дата рождения
            InkWell(
              onTap: (() async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (newDate == null) return;
                setState(
                  () {
                    this.date = newDate;
                  },
                );
                await UserSimplePreferences.setBirthday(date);
              }),
              child: Container(
                padding: EdgeInsets.all(10),
                width: 350,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(75, 0, 0, 0),
                      blurRadius: 20,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${date.day}   |   ${date.month}   |   ${date.year}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Кнопки (Выбор даты) /  (Далее)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                  ),
                  onPressed: (() => {
                        Navigator.pushReplacementNamed(context, '/main_page'),
                      }),
                  child: Container(
                    width: 320,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign in",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
