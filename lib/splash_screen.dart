import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_webview_medicus/NoInternet.dart';

import 'home.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, GetConnect);
  }


  void GetConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NoInternet()));
    } else if (connectivityResult == ConnectivityResult.mobile) {
      navigationPage();

    } else if (connectivityResult == ConnectivityResult.wifi) {
      navigationPage();

    }
  }


  void navigationPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyApp()));
  }


  @override
  void initState() {
    super.initState();
    startTime();

  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Center(child: Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(image: new AssetImage('images/splashimg.jpeg',),
                fit: BoxFit.fill,)
        ),
        // child: new Image.asset('images/splashscreen.jpg',fit: BoxFit.cover,),
      ),),
    );
  }
}
