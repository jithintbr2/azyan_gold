import 'dart:async';
import 'package:azyan/foreUpdate.dart';
import 'package:azyan/httpService.dart';
import 'package:azyan/updateModel.dart';
import 'package:flutter/material.dart';
import 'package:azyan/common.dart';
import 'package:azyan/dashboard.dart';
import 'package:azyan/login.dart';
import 'package:azyan/new_login.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash2 extends StatefulWidget {
  @override
  _newSplashState createState() => _newSplashState();
}

class _newSplashState extends State<Splash2> {
  final splashDelay = 2;
  UpdateModel updatedata;

  @override
  void initState() {
    super.initState();
    getData();


  }
  getData() async {
    updatedata = await HttpService.forceUpdate();
    final newVersion=NewVersion(
      androidId:"com.azyan",
    );
    final status=await newVersion.getVersionStatus();
    print(status.localVersion);
    print(updatedata.data.minVersion);
    int versionCompare=status.localVersion.compareTo(updatedata.data.minVersion);
    if(versionCompare<0)
      {
        _checkVersion();
      }
    else
      {
        _loadWidget();
      }

  }
  void _checkVersion()
  async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ForceUpdate()),
    );
    /*final newVersion=NewVersion(
      androidId:"com.azyan",
    );
    final status=await newVersion.getVersionStatus();

    newVersion.showUpdateDialog(context: context,
      versionStatus: status,
      dialogTitle: "UPDATE!!!",
      dismissButtonText: "Skip",
      dialogText: "Please Update The app From "+ "${status.localVersion}"+" to "+"${status.storeVersion}",
      dismissAction: (){
        SystemNavigator.pop();
      },
      updateButtonText: "Update",

    );*/

  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    // return '';
    // return Timer(_duration, navigationPage);
    return Timer(_duration, routeTOHomePage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Image.asset(
              'assets/images/logo.png',width: 200,),
        ));
  }

  routeTOHomePage() async {
    // Navigator.pushReplacementNamed(context, RouteDashBoard);
    String tocken = await Common.getSharedPref("tocken");

    if (tocken != null)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Dashboard(tocken)),
      );
    else
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => NewLogin()),
      );
  }






}

