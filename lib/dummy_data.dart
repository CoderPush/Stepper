import 'package:stepper/domain/models/area.dart';

const String avatarProfileUrl =
    'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29tYW4lMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80';

final List<Area> scopeAreaList = [
  Area(areaName: 'S1', numberOfUpdate: 2, rating: 3, areaType: AreaType.scope),
  Area(areaName: 'S2', numberOfUpdate: 4, rating: 2, areaType: AreaType.scope),
  Area(areaName: 'S3', numberOfUpdate: 5, rating: 1, areaType: AreaType.scope),
  Area(areaName: 'S4', numberOfUpdate: 8, rating: 3, areaType: AreaType.scope),
  Area(areaName: 'S5', numberOfUpdate: 2, rating: 1, areaType: AreaType.scope),
];

final List<Area> expertiseAreaList = [
  Area(areaName: 'E1', numberOfUpdate: 2, rating: 3, areaType: AreaType.expertise),
  Area(areaName: 'E2', numberOfUpdate: 4, rating: 2, areaType: AreaType.expertise),
  Area(areaName: 'E3', numberOfUpdate: 5, rating: 1, areaType: AreaType.expertise),
  Area(areaName: 'E4', numberOfUpdate: 8, rating: 3, areaType: AreaType.expertise),
  Area(areaName: 'E5', numberOfUpdate: 2, rating: 1, areaType: AreaType.expertise),
];

final List<Area> mindsetAreaList = [
  Area(areaName: 'M1', numberOfUpdate: 2, rating: 3, areaType: AreaType.mindset),
  Area(areaName: 'M2', numberOfUpdate: 4, rating: 2, areaType: AreaType.mindset),
  Area(areaName: 'M3', numberOfUpdate: 5, rating: 1, areaType: AreaType.mindset),
  Area(areaName: 'M4', numberOfUpdate: 8, rating: 3, areaType: AreaType.mindset),
  Area(areaName: 'M5', numberOfUpdate: 2, rating: 1, areaType: AreaType.mindset),
];
