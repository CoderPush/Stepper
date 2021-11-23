import 'package:stepper/data/model/routing_data.dart';

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    print(uriData.queryParameters);
    print(uriData.path);
    return RoutingData(
      route: uriData.path,
      queryParameter: uriData.queryParameters,
    );
  }
}
