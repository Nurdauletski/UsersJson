import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:show_users/main_page.dart';
import 'login.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Users',
      theme: ThemeData(
        backgroundColor: Colors.white,

      ),
      home: MainPage(),
    );
  }
}
