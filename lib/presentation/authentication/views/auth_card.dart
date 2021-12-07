import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/config/routes/routes.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';

enum AuthMode { signUp, signIn }

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  AuthMode _authMode = AuthMode.signIn;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  var _isLoading = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _slideAnimation =
        Tween(begin: const Offset(0, -1), end: const Offset(0, 0)).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.signIn) {
      setState(() {
        _authMode = AuthMode.signUp;
      });
      _animationController.forward();
    } else {
      setState(() {
        _authMode = AuthMode.signIn;
      });
      _animationController.reverse();
    }
  }

  void _submit(BuildContext context) async {
    // Unfocus soft keyboard when pressing login/register button
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    final authenticationCubit = context.read<AuthenticationCubit>();
    if (_authMode == AuthMode.signIn) {
      await authenticationCubit.signInWithEmailAndPassword(
          _authData['email']!, _authData['password']!);
    } else {
      await authenticationCubit.registerWithEmailAndPassword(
          _authData['email']!, _authData['password']!);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          Navigator.of(context).pushReplacementNamed(RouteNames.home);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _authMode == AuthMode.signIn ? signIn : createAnAccount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(screenMediumPadding),
                      hintText: "Enter your email here",
                      hintStyle: const TextStyle(color: mediumGrey),
                      fillColor: scaffoldColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(extraLargeBorderRadius * 2),
                        borderSide: const BorderSide(
                          color: white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(extraLargeBorderRadius * 2),
                        borderSide: const BorderSide(
                          color: white,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(extraLargeBorderRadius * 2),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(extraLargeBorderRadius * 2),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    onSaved: (email) {
                      _authData['email'] = email!;
                    },
                    validator: (email) {
                      if (email != null && email.isEmpty ||
                          !email!.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: screenMediumPadding),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(screenMediumPadding),
                      hintText: "Enter your password here",
                      hintStyle: const TextStyle(color: mediumGrey),
                      fillColor: scaffoldColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(extraLargeBorderRadius * 2),
                        borderSide: const BorderSide(
                          color: white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(extraLargeBorderRadius * 2),
                        borderSide: const BorderSide(
                          color: white,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(extraLargeBorderRadius * 2),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(extraLargeBorderRadius * 2),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    obscureText: true,
                    onSaved: (password) {
                      _authData['password'] = password!;
                    },
                    validator: (password) {
                      if (password != null && password.isEmpty ||
                          password!.length < 5) {
                        return 'Password is too short!';
                      }
                      return null;
                    },
                  ),
                  _authMode == AuthMode.signIn
                      ? const SizedBox()
                      : Container(
                          padding:
                              const EdgeInsets.only(top: screenMediumPadding),
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.all(screenMediumPadding),
                                  hintText: "Re-enter your password here",
                                  hintStyle: const TextStyle(color: mediumGrey),
                                  fillColor: scaffoldColor,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        extraLargeBorderRadius * 2),
                                    borderSide: const BorderSide(
                                      color: white,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        extraLargeBorderRadius * 2),
                                    borderSide: const BorderSide(
                                      color: white,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        extraLargeBorderRadius * 2),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        extraLargeBorderRadius * 2),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                validator: (repassword) {
                                  if (repassword != _passwordController.text) {
                                    return 'Passwords do not match!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            (state is AuthenticationError)
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: screenMediumPadding,
                    ),
                    child: Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : const SizedBox(
                    height: screenMediumPadding,
                  ),
            _isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  )
                : SizedBox(
                    width: double.infinity,
                    height: 45.0,
                    child: ElevatedButton(
                      onPressed: () => _submit(context),
                      child:
                          Text(_authMode == AuthMode.signIn ? signIn : signUp),
                      style: ElevatedButton.styleFrom(
                        primary: orange,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(extraLargeBorderRadius),
                        ),
                      ),
                    ),
                  ),
            TextButton(
              onPressed: _switchAuthMode,
              child: Text(
                  _authMode == AuthMode.signIn ? signUpInstead : logInInstead),
            ),
          ],
        );
      },
    );
  }
}
