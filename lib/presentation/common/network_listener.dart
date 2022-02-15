import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:stepper/data/helpers/precache_firestore_handler.dart';
import 'package:stepper/injection_container.dart';

class NetworkListener extends StatefulWidget {
  final Widget Function(BuildContext) builder;
  final PreCacheFirestoreHandler preCacheFirestoreHandler;

  const NetworkListener(
      {Key? key, required this.builder, required this.preCacheFirestoreHandler})
      : super(
          key: key,
        );

  @override
  _NetworkListenerState createState() => _NetworkListenerState();
}

class _NetworkListenerState extends State<NetworkListener> {
  final _connectivity = Connectivity();
  StreamSubscription? _networkListener;

  @override
  void initState() {
    widget.preCacheFirestoreHandler.init();
    _networkListener = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        log('Network Disconnected');
        log('Firestore using cached database');

        sl.get<FirebaseFirestore>().disableNetwork();
      } else {
        sl.get<FirebaseFirestore>().enableNetwork();
        log('Network Connected');
        log('Firestore using with server database');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _networkListener?.cancel();
    widget.preCacheFirestoreHandler.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
