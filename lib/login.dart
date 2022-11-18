import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children:<Widget> [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.white,
          ),
          //Background Image Container -->
          Container(
            width: size.width,
            height: size.height / 1.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg_image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Center Form Container -->
          Center(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: size.height / 2.7,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(2, 28, 96, 0.2),
                        blurRadius: 16
                    )
                  ]
              ),
              child: Column(
                children: [
                  //Email Input -->
                  SizedBox(
                    width: 230.0,
                    child: TextField(
                      autofocus: true,
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(216, 216, 216, 1)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(130, 130, 130, 1)),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                        ),
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(216, 216, 216, 1)
                        ),
                      ),
                    ),
                  ),
                  //Password Input -->
                  Padding(padding: EdgeInsets.only(top: 40)),
                  SizedBox(
                    width: 230.0,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(216, 216, 216, 1)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(130, 130, 130, 1)),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1)
                        ),
                        hintStyle: TextStyle(

                        ),
                      ),
                    ),
                  ),
                  //Login Button -->
                  Padding(padding: EdgeInsets.only(top: 40)),
                  ElevatedButton(
                    onPressed: () {signIn();},
                    child: Text('Войти'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(155, 81, 224, 1),
                      textStyle: TextStyle(
                        fontSize: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      minimumSize: const Size.fromHeight(38),
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
