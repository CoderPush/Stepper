class RoutingData {
  final String route;
  final Map<String, String>? _queryParameters;

  RoutingData({
    required this.route,
    Map<String, String>? queryParameter,
  }) : _queryParameters = queryParameter;

  operator [](String key) => _queryParameters?[key];
}
