import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:show_users/login.dart';
import 'home_page.dart';
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            // FirebaseAuth.instance.signOut();
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      )
    );
  }
}
