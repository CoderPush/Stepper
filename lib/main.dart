import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/config/routes/app_routes.dart';
import 'package:stepper/injection_container.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';
import 'package:stepper/presentation/common/drawer/drawer.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await dotenv.load(fileName: ".env");
  // enable data persistence on Flutter web
  if (kIsWeb) {
    try {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: dotenv.env['APIKEY']!,
          authDomain: dotenv.env['AUTHDOMAIN']!,
          projectId: dotenv.env['PROJETID']!,
          storageBucket: dotenv.env['STORAGEBUCKET']!,
          messagingSenderId: dotenv.env['MESSAGINGSENDERID']!,
          appId: dotenv.env['APPID']!,
          measurementId: dotenv.env['MEASUREMENTID']!,
        ),
      );
      await FirebaseFirestore.instance
          .enablePersistence(const PersistenceSettings(synchronizeTabs: true));
      // ignore: empty_catches
    } catch (e) {}
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerCubit>(create: (context) => DrawerCubit()),
        BlocProvider(
          create: (context) => AuthenticationCubit(
            userRepository: sl(),
            bandRepository: sl(),
            professionRepository: sl(),
          ),
        )
      ],
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return MaterialApp(
              key: UniqueKey(),
              debugShowCheckedModeBanner: false,
              title: 'Stepper',
              theme: ThemeData(
                scaffoldBackgroundColor: scaffoldColor,
                primarySwatch: Colors.blue,
                textSelectionTheme: const TextSelectionThemeData(
                  cursorColor: white,
                ),
                textTheme: Theme.of(context).textTheme.apply(
                      bodyColor: textColor,
                      displayColor: textColor,
                    ),
              ),
              initialRoute: state is AuthenticatedState
                  ? RouteNames.home
                  : RouteNames.auth,
              onGenerateRoute: AppRoutes.onGenerateRoutes,
            );
          }
        },
      ),
    );
  }
}
