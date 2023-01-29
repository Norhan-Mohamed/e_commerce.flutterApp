import 'package:e_commerce/screens/loginAndRegisterScreen/dart/registerScreen.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // This widget is the root of your application.
  @override
  var myFocus;
  void initState() {
    super.initState();
    myFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    myFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff69b7cf), Color(0xff3be6bc)])),
              height: 210,
            ),
            Container(
              height: 450,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color(0xff3fedbd),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(hintText: ' Email '),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            focusNode: myFocus,
                            decoration: InputDecoration(hintText: 'Password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xff3fedbd),
                                  )),
                                  onPressed: () =>
                                      print(' to make a new password...'),
                                  child: Text(
                                    "Forget Password ?",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                  Color(0xff3fedbd),
                                )),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    scaffoldKey.currentState!;
                                    ScaffoldMessenger(
                                        child: SnackBar(
                                            content: Text('logged in')));
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  }
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xff3fedbd),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Center(
                  heightFactor: 2.9,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
