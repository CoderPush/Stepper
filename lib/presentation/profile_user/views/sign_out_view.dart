import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';

class SignOutView extends StatelessWidget {
  const SignOutView({Key? key}) : super(key: key);

  void _onUserSignOut(BuildContext context) {
    context.read<AuthenticationCubit>().onUserSignOut();
    Navigator.of(context).pop();
  }

  void _showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text(cancel),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget confirmButton = TextButton(
      child: const Text(confirm),
      onPressed: () => _onUserSignOut(context),
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        confirmation,
        style: TextStyle(color: black),
      ),
      content: const Text(
        logoutConfirmationText,
        style: TextStyle(color: black),
      ),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAlertDialog(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: twelve),
        width: double.infinity,
        decoration: BoxDecoration(
          color: blueGrey,
          borderRadius: BorderRadius.circular(largeBorderRadius),
        ),
        child: const Center(
          child: Text(
            signOut,
            style: TextStyle(color: orange, fontSize: seventeen),
          ),
        ),
      ),
    );
  }
}
