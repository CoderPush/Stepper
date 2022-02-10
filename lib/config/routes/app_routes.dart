import 'package:flutter/material.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/config/extensions/string_extensions.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/about/about_screen.dart';
import 'package:stepper/presentation/area/area_screen.dart';
import 'package:stepper/presentation/authentication/authentication_screen.dart';
import 'package:stepper/presentation/calendar/calendar_screen.dart';
import 'package:stepper/presentation/common/arguments/screen_arguments.dart';
import 'package:stepper/presentation/create_post/create_post_screen.dart';
import 'package:stepper/presentation/home/home_screen.dart';
// import 'package:stepper/presentation/post_detail/post_detail_screen.dart';
import 'package:stepper/presentation/post_list/post_list_screen.dart';
import 'package:stepper/presentation/profile_user/profile_user_screen.dart';
import 'package:stepper/presentation/profile_user_edit/profile_user_edit_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    final routingData = settings.name?.getRoutingData;
    // remove this when apply routing params for postList, postDetail
    final args = settings.arguments;

    switch (routingData?.route) {
      case RouteNames.home:
        return _materialRoute(const HomeScreen(), settings);
      case RouteNames.area:
        return _materialRoute(const AreaScreen(), settings);
      case RouteNames.postList:
        if (args is Area) {
          return _materialRoute(PostListScreen(area: args), settings);
        }
        return _errorRoute();
      // TODO:
      // case RouteNames.postDetail:
      //   if (args is Post) {
      //     return _materialRoute(PostDetailScreen(selectedPost: args), settings);
      //   }
      //   return _errorRoute();
      case RouteNames.createPost:
        final createPostScreenArgument = CreatePostScreenArgument(
          preSelectedArea: routingData?['area'],
          preSelectedPostId: routingData?['postId'],
        );
        return _materialRoute(
            CreatePostScreen(argument: createPostScreenArgument), settings);
      case RouteNames.calendar:
        return _materialRoute(const CalendarScreen(), settings);
      case RouteNames.profileUser:
        return _materialRoute(const ProfileUserScreen(), settings);
      case RouteNames.profileUserEdit:
        return _materialRoute(const ProfileUserEditScreen(), settings);
      case RouteNames.auth:
        return _materialRoute(const AuthenticationScreen(), settings);
      case RouteNames.about:
        return _materialRoute(const AboutScreen(), settings);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _materialRoute(Widget view, RouteSettings settings) {
    return MaterialPageRoute(settings: settings, builder: (_) => view);
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
