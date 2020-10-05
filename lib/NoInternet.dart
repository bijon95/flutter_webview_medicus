import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_medicus/splash_screen.dart';
class NoInternet extends StatefulWidget {
  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(Icons.signal_wifi_off,size: 50,),
              SizedBox(
                height: 20,
              ),
              Text("Ooops!",style: TextStyle(fontSize: 30),),
              SizedBox(
                height: 10,
              ),
              Text("No Internet Connection Found \n Checkyour Connection"),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                color: Colors.green,
                child: Text("Try Again",style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
