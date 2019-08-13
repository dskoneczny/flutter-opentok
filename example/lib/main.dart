import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:health_stats/health_stats.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = const MethodChannel("com.stl.flutchat/opentok");
  var _callDuration;
  String _platformVersion = 'Unknown';

  void _openVideoCallScreen() async {
    print("item clicked");
    var callDuration = "Unknown call duration.";
    try {
      callDuration = await platform.invokeMethod("openVideoChat");
    } on PlatformException catch (_) {
      callDuration = "Failed to get call duration.";
    }
    setState(() {
      _callDuration = callDuration;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await HealthStats.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app2'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Start Video Call"),
            onPressed: _openVideoCallScreen,
            textTheme: ButtonTextTheme.accent,
          ),
        ),
      ),
    );
  }
}
