import 'package:flutter/material.dart';
import 'package:life_secundomer_app/pages/LoginPage/age_page.dart';
import 'package:life_secundomer_app/pages/LoginPage/name_page.dart';
import 'package:life_secundomer_app/utils/UserSimplePrefernces.dart';
import 'pages/MainPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/name': (context) => const LoginPage(),
        '/age': (context) => const AgePage(),
        '/main_page': (context) => const MainPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
