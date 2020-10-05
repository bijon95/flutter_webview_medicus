import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_webview_medicus/NoInternet.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GonoShop',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: WebViewContainer(),
    );
  }
}


class WebViewContainer extends StatefulWidget {


  @override
  createState() => _WebViewContainerState();
}
class _WebViewContainerState extends State<WebViewContainer> {
  //var _url;

  final _key = UniqueKey();
  // _WebViewContainerState(this._url);
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  StreamSubscription<WebViewHttpError> _onHttpError;
  StreamSubscription _onDestroy;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
//    // TODO: implement initState
    flutterWebViewPlugin.launch("http://medicusbd.com/");
    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebViewPlugin.onDestroy.listen((_) {
      if (mounted) {
        // Actions like show a info toast.
        _scaffoldKey.currentState.showSnackBar(
            const SnackBar(content: const Text('Webview Destroyed')));
      }
    });


  }
  Future<void> _launched;
  String _phone = '';

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final flutterWebviewPlugin = new FlutterWebviewPlugin();
    flutterWebviewPlugin.onUrlChanged.listen((event) {
      if (event.startsWith('tel:')){
        print("call phone");

  //      flutterWebviewPlugin.launch(event, hidden: true);
       flutterWebviewPlugin.stopLoading();
       flutterWebviewPlugin.reload();
        _launched = _makePhoneCall('$event');

      }
      else if(event.startsWith('mailto:')){
        print("mail open ");

        //      flutterWebviewPlugin.launch(event, hidden: true);
        flutterWebviewPlugin.stopLoading();
        flutterWebviewPlugin.reload();
        _launched = _makePhoneCall('$event');

      }
    });


    return Scaffold(
      key: _scaffoldKey,
//      body: SafeArea(
//        child: WebviewScaffold(
//          // appBar: new AppBar(title: new Text(this.title), backgroundColor: Colors.blue),
//          //    url: "https://www.ocar.biz/guide/post/view/"+_id,);
//            url: "http://medicusbd.com/"),
 //     ),
    );
  }


}