import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:stepper/injection_container.dart';

class NetworkListener extends StatefulWidget {
  final Widget child;

  const NetworkListener({Key? key, required this.child})
      : super(
          key: key,
        );

  @override
  _NetworkListenerState createState() => _NetworkListenerState();
}

class _NetworkListenerState extends State<NetworkListener> {
  final _connectivity = Connectivity();
  StreamSubscription? stream;
  @override
  void initState() {
    stream = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        log('Network Disconnected');
        log('Firestore using cached db');

        sl.get<FirebaseFirestore>().disableNetwork();
      } else {
        sl.get<FirebaseFirestore>().enableNetwork();
        log('Network Connected');
        log('Firestore connected with server');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    stream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
