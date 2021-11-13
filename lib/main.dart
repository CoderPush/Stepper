import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/area/area.dart';
import 'package:stepper/presentation/calendar/calendar_screen.dart';
import 'package:stepper/presentation/common/drawer/drawer.dart';
import 'package:stepper/presentation/home/home_screen.dart';
import 'package:stepper/presentation/post_list/post_list_screen.dart';
import 'package:stepper/presentation/post_detail/post_detail_screen.dart';
import 'package:stepper/presentation/create_post/create_post_screen.dart';
import 'package:stepper/presentation/profile_user/profile_user_screen.dart';
import 'package:stepper/presentation/profile_user_edit/profile_user_edit_screen.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/profile_user_edit_cubit.dart';
import 'package:stepper/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stepper',
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldColor,
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: textColor,
                displayColor: textColor,
              ),
        ),
        home: const HomeScreen(),
        routes: {
          Routes.home: (context) => const HomeScreen(),
          Routes.area: (context) => const AreaScreen(),
          Routes.postList: (context) => const PostListScreen(),
          Routes.postDetail: (context) => const PostDetailScreen(),
          Routes.createPost: (context) => const CreatePostScreen(),
          Routes.calendar: (context) => const CalendarScreen(),
          Routes.profileUser: (context) => const ProfileUserScreen(),
          Routes.profileUserEdit: (context) => BlocProvider(
                create: (context) => ProfileUserEditCubit(
                  professionRepository: sl(),
                  bandRepository: sl(),
                ),
                child: const ProfileUserEditScreen(),
              ),
        },
      ),
    );
  }
}
