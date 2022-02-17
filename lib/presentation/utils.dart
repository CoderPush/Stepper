import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/models/models.dart';

List<Color> getAreaTheme(AreaType areaType) {
  switch (areaType) {
    case AreaType.scope:
      return scopeScheme;
    case AreaType.expertise:
      return expertiseScheme;
    case AreaType.mindset:
      return mindsetScheme;
  }
}

// Temporary function to get AreaType from AreaName
AreaType getAreaType(String areaName) {
  if (areaName.contains('S')) {
    return AreaType.scope;
  } else if (areaName.contains('E')) {
    return AreaType.expertise;
  } else {
    return AreaType.mindset;
  }
}

class Debounce {
  final int miliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debounce({this.miliseconds = 500});

  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer = Timer(Duration(milliseconds: miliseconds), action);
  }

  void cancel() => _timer?.cancel();
}

T? getItemByName<T>(
    {required List<T> list,
    required String name,
    required String Function(T) getter}) {
  try {
    return list.firstWhere(
      (item) => getter(item) == name,
    );
  } catch (error) {
    return null;
  }
}
