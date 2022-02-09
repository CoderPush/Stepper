import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';

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

AreaType convertAreaTypeString(String areaType) => AreaType.values.firstWhere(
    (type) => type.toString().split('.')[1] == areaType.toLowerCase());

List<Area> sortAreasInOrder(List<Area> areaList) {
  return areaList
    ..sort((first, next) => first.areaName
        .substring(1)
        .padLeft(3, '0')
        .compareTo(next.areaName.substring(1).padLeft(3, '0')));
}

// Parse timestamp from Firestore
DateTime? parseTime(dynamic date) {
  if (date is int) {
    return DateTime.fromMicrosecondsSinceEpoch(date);
  } else if (date is Timestamp) {
    return (date).toDate();
  }
  return null;
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
