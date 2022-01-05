import 'package:azyan/pushNotification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:azyan/common.dart';
import 'package:azyan/dashboard.dart';
import 'package:azyan/model.dart';
import 'package:azyan/httpService.dart';
import 'package:azyan/otpScreen.dart';
import 'package:azyan/transactionModel.dart';

class NewLogin extends StatefulWidget {
  @override
  _NewLoginState createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String firebaseToken;

  // FirebaseNotifcation firebase;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  handleAsync() async {
    // await firebase.initialize();
    //print('before');
    firebaseToken = await _firebaseMessaging.getToken();
    print("Firebase token : $firebaseToken");
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    // firebase = FirebaseNotifcation();
    handleAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.phone_android),
                            hintText: 'Enter Your Mobile Number',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock),
                            hintText: 'Enter Your Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
                      );
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        if (username.text.isEmpty) {
                          Common.toastMessaage(
                              'Username cannot be empty', Colors.red);
                        } else if (password.text.isEmpty) {
                          Common.toastMessaage(
                              'Password cannot be empty', Colors.red);
                        } else {
                          RersultModel object = await HttpService.login(
                              username.text, password.text, firebaseToken);

                          if (object.status == true) {
                            Common.saveSharedPref("tocken", object.data.token);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Dashboard(object.data.token)),
                            );

                            Common.toastMessaage(
                                'Login Success Please Wait', Colors.green);
                          } else {
                            Common.toastMessaage(
                                'Invalid Username And Password', Colors.red);
                          }
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
