import 'package:azyan/details.dart';
import 'package:azyan/receipt.dart';
import 'package:flutter/material.dart';
import 'package:azyan/httpService.dart';
import 'package:splashscreen/splashscreen.dart';

class PaymentSuccess extends StatefulWidget {
int tempId;
String tocken;
PaymentSuccess(this.tempId,this.tocken);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
 @override




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow[800],
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Success',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body:
               Container(
                   width: MediaQuery.of(context).size.height * .9,
            child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage:AssetImage('assets/images/success.png'),
                  radius: 50,
                ),
                Text('Success',style: TextStyle(fontSize: 30,color:Colors.green,fontWeight: FontWeight.bold),),
                Text('Payment is SuccessFully Completed',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  Details(widget.tempId,widget.tocken)),
                              (Route<dynamic> route) => false);

                    },
                    child: Text(
                      'Go to Receipt',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            )

          )
               ),
    );
  }
}
