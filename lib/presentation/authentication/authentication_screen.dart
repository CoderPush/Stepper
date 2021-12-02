import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/presentation/authentication/views/auth_card.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: deviceSize.height / 4,
              horizontal: screenLargePadding * 2,
            ),
            child: const AuthCard(),
          ),
        ),
      ),
    );
  }
}
