import 'package:azyan/collectionReport.dart';
import 'package:azyan/pushNotification.dart';
import 'package:flutter/material.dart';
import 'package:azyan/httpService.dart';
import 'package:azyan/listSchemes.dart';
import 'package:azyan/profile.dart';
import 'package:azyan/profileModel.dart';
import 'package:splashscreen/splashscreen.dart';

class Dashboard extends StatefulWidget {
  String tocken;

  Dashboard(this.tocken);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ProfileModel schemData;


  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }

  getData() async {
    schemData = await HttpService.profile(widget.tocken);
    if (schemData != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          body: schemData != null
              ? Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 10,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bg1.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/user_image.jpg'),
                                    radius: 40,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        schemData.data.firstName,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        schemData.data.mobileNumber,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 50),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.16,
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(15)),
                                      child: InkWell(
                                        onTap: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Profile(widget.tocken)),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/user_image.jpg'),
                                              radius: 40,
                                            ),
                                            Text(
                                              'My Profile',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),

                                  Container(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.16,
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    child:  Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(15)),
                                      child: InkWell(
                                        onTap: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ListSchemes(widget.tocken)),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/scheme_icon.png'),
                                              radius: 40,
                                            ),
                                            Text(
                                              'My Schemes',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),

                                ],
                              ),
                            ),


                            Container(
                              height: MediaQuery.of(context)
                                  .size
                                  .height *
                                  0.11,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Card(
                                elevation: 10,
                                shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          CollectionReport(widget.tocken)),
                                    );
                                  },

                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left:20),
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/icon_collection_report.jpg'),
                                            radius: 25,
                                          ),
                                        ),


                                        Padding(
                                          padding: const EdgeInsets.only(left:20,right: 20),
                                          child: Text('Transaction Report',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                        ),




                                      ],
                                    ),
                                  ),
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: SplashScreen(
                    seconds: 6,
                    loadingText: Text("Loading"),
                    photoSize: 100.0,
                    loaderColor: Colors.blue,
                  ),
                ));

  }
}
