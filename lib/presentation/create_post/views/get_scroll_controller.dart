import 'package:flutter/material.dart';

class GetScrollController extends InheritedWidget {
  GetScrollController({Key? key, required child})
      : super(key: key, child: child);

  final scrollController = ScrollController();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static GetScrollController of(BuildContext context) {
    final GetScrollController? result =
        context.dependOnInheritedWidgetOfExactType<GetScrollController>();
    assert(result != null, 'No GetScrollController found in context');
    return result!;
  }
}
