import 'package:flutter/material.dart';
import 'package:azyan/changePassword.dart';
import 'package:azyan/common.dart';
import 'package:azyan/httpService.dart';
import 'package:azyan/new_login.dart';
import 'package:azyan/profileModel.dart';
import 'package:azyan/webView.dart';
import 'package:splashscreen/splashscreen.dart';


class Profile extends StatefulWidget {
  String token;
  Profile(this.token);
@override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileModel schemData;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData () async {
    schemData = await HttpService.profile(widget.token);

    if(schemData!=null)
    {
      setState(() {

      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
      schemData!=null?
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            CircleAvatar(
              backgroundImage:AssetImage('assets/images/user_image.jpg'),
              radius: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(schemData.data.firstName!=null?schemData.data.firstName:'a',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),


              ],
            ),
            Text('Personal Details',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:25),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.green,
                        size: 24.0,
                      ),
                      SizedBox(width: 10,),

                      Text(schemData.data.mobileNumber,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ),


              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:25),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 24.0,
                      ),
                      SizedBox(width: 10,),
                      Text(schemData.data.permenentAddressLine1!=null?schemData.data.permenentAddressLine1:'',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                    ],
                  ),
                ),


              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:25),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.green,
                        size: 24.0,
                      ),
                      SizedBox(width: 10,),
                      Text(schemData.data.emailId!=null?schemData.data.emailId:'',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ),



              ),
            ),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.05,
                            width: MediaQuery.of(context)
                                .size
                                .width *
                                0.45,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                              BorderRadius.circular(16),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangePassword(widget.token)),
                                );
                              },
                              child: Text(
                                'Change Password',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          height: MediaQuery.of(context)
                              .size
                              .height *
                              0.05,
                          width: MediaQuery.of(context)
                              .size
                              .width *
                              0.45,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                            BorderRadius.circular(16),
                          ),
                          child: FlatButton(
                            onPressed:()=>_dialogue(context),
                            child: Text(
                              'Log Out',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )),
                      SizedBox(
                        width:10,
                      ),


                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:30),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: MediaQuery.of(context)
                                  .size
                                  .height *
                                  0.05,
                              width: MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.8,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius:
                                BorderRadius.circular(16),
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WebViewPage('Terms And Condition','https://login2.in/azyan/index.php/Mobile/terms_and_conditions')),
                                  );
                                },
                                child: Text(
                                  'Terms And Condition',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )),
                        ),






                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:30),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: MediaQuery.of(context)
                                  .size
                                  .height *
                                  0.05,
                              width: MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.8,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius:
                                BorderRadius.circular(16),
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WebViewPage('Privacy Policy','https://login2.in/azyan/index.php/Mobile/privacy_policy')),
                                  );
                                },
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )),
                        ),






                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:30),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: MediaQuery.of(context)
                                  .size
                                  .height *
                                  0.05,
                              width: MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.8,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius:
                                BorderRadius.circular(16),
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WebViewPage('Refund Policy','https://login2.in/azyan/index.php/Mobile/refund_policy')),
                                  );
                                },
                                child: Text(
                                  'Refund Policy',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )),
                        ),






                      ],
                    ),
                  ),
                ),

              ],
            )


          ],
        ),
      ):Container(
        child: SplashScreen(
          seconds: 6,
          loadingText: Text("Loading"),
          photoSize: 100.0,
          loaderColor: Colors.blue,
        ),
      )
    );
  }


  void _dialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Are you sure to Logout?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    Common.saveSharedPref("Logout","success");
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) =>
                                NewLogin()),
                            (Route<dynamic> route) => false);

                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'))
            ],
          );
        });
  }


}
