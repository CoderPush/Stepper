import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (context.read<AuthenticationCubit>().isUserSignedIn()) {
        Navigator.of(context).pushReplacementNamed(RouteNames.home);
      } else {
        Navigator.of(context).pushReplacementNamed(RouteNames.auth);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
