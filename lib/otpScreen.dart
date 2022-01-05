
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:azyan/common.dart';
import 'package:azyan/httpService.dart';
import 'package:azyan/otpVerify.dart';
import 'package:azyan/sendOtpModel.dart';
import 'package:azyan/verifyPhoneModel.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {


  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController phoneController = new TextEditingController();
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
                          controller: phoneController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.phone_android),
                            hintText: 'Phone Number',
                          ),
                        ),
                      ),
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
                       final signCode=await SmsAutoFill().getAppSignature;
                        if (phoneController.text.isEmpty) {
                          Common.toastMessaage(
                              'phone Number cannot be empty', Colors.red);
                        }
                        else
                          {


                            VerifyPhoneModel object = await HttpService.verifyPhonenumber(
                                phoneController.text);
                          if (object.status == true) {
                            final signCode=await SmsAutoFill().getAppSignature;
                            int min = 1000; //min and max values act as your 6 digit range
                            int max = 9999;
                            var randomizer = new Random();
                            var rNum = min + randomizer.nextInt(max - min);
                            SendOtpModel otp=await HttpService.sendOtp(
                                phoneController.text,rNum,signCode);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OtpVerify(phoneController.text,rNum)),
                                    (Route<dynamic> route) => false);


                            Common.toastMessaage(
                                'Verified', Colors.green);
                          }
                          else
                            {
                              Common.toastMessaage(
                                  'Phone Number Not Matching', Colors.red);
                            }
                          }
                      },
                      child: Text(
                        'Send Otp',
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
