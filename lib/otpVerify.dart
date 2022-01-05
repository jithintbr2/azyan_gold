
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:azyan/common.dart';
import 'package:azyan/forgotPassword.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpVerify extends StatefulWidget {
String phoneNumber;
int rNO;
OtpVerify(this.phoneNumber,this.rNO);
  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {

  TextEditingController otpController = new TextEditingController();
  @override
  void initState() {

    super.initState();
    _fetchOtp();
  }
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

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                    child:PinFieldAutoFill(
                      codeLength: 4,
                        controller: otpController,
                      onCodeChanged: (val){


                      }
                    )
                  ),




                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: FlatButton(
                        onPressed: () async {
                          if (otpController.text.isEmpty) {
                            Common.toastMessaage(
                                'otp cannot be empty', Colors.red);
                          }
                          else if(widget.rNO!=otpController.text)
                            {
                              Common.toastMessaage(
                                  'Invalid OTP', Colors.red);
                            }
                          else
                          {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPassword(widget.phoneNumber)),
                                    (Route<dynamic> route) => false);

                          }
                        },
                        child: Text(
                          'Verify',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
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
  void _fetchOtp() async
  {
    await SmsAutoFill().listenForCode();
  }
}
