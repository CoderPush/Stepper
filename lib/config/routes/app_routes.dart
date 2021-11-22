import 'package:flutter/material.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/area/area_screen.dart';
import 'package:stepper/presentation/calendar/calendar_screen.dart';
import 'package:stepper/presentation/common/arguments/screen_arguments.dart';
import 'package:stepper/presentation/create_post/create_post_screen.dart';
import 'package:stepper/presentation/home/home_screen.dart';
import 'package:stepper/presentation/post_detail/post_detail_screen.dart';
import 'package:stepper/presentation/post_list/post_list_screen.dart';
import 'package:stepper/presentation/profile_user/profile_user_screen.dart';
import 'package:stepper/presentation/profile_user_edit/profile_user_edit_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.home:
        return _materialRoute(const HomeScreen());
      case RouteNames.area:
        return _materialRoute(const AreaScreen());
      case RouteNames.postList:
        if (args is Area) {
          return _materialRoute(PostListScreen(area: args));
        }
        return _errorRoute();
      case RouteNames.postDetail:
        if (args is Post) {
          return _materialRoute(PostDetailScreen(selectedPost: args));
        }
        return _errorRoute();
      case RouteNames.createPost:
        if (args is CreatePostScreenArgument) {
          return _materialRoute(CreatePostScreen(argument: args));
        }
        return _errorRoute();
      case RouteNames.calendar:
        return _materialRoute(const CalendarScreen());
      case RouteNames.profileUser:
        return _materialRoute(const ProfileUserScreen());
      case RouteNames.profileUserEdit:
        return _materialRoute(const ProfileUserEditScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
