import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:azyan/splashScreen.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initFirebase();
    return MaterialApp(home: Splash2());
  }
  initFirebase()async{
    await Firebase.initializeApp();
  }
}
