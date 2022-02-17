class RoutingData {
  final String route;
  final Map<String, String>? _queryParameters;

  RoutingData({
    required this.route,
    Map<String, String>? queryParameter,
  }) : _queryParameters = queryParameter;

  operator [](String key) => _queryParameters?[key];
}

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    return RoutingData(
      route: uriData.path,
      queryParameter: uriData.queryParameters,
    );
  }

  String capitalizeFirstLetter() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
