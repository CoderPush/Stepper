import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';

enum AuthMode { Signup, Signin }

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  AuthMode _authMode = AuthMode.Signin;
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
    if (_authMode == AuthMode.Signin) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _animationController.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Signin;
      });
      _animationController.reverse();
    }
  }

  void _submit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    final authenticationCubit = context.read<AuthenticationCubit>();
    if (_authMode == AuthMode.Signin) {
      authenticationCubit.signInWithEmailAndPassword(
          _authData['email']!, _authData['password']!);
    } else {
      authenticationCubit.registerWithEmailAndPassword(
          _authData['email']!, _authData['password']!);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          _authMode == AuthMode.Signin ? signIn : createAnAccount,
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
                  if (email != null && email.isEmpty || !email!.contains('@')) {
                    return 'Invalid email!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
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
              const SizedBox(
                height: 8,
              ),
              _authMode == AuthMode.Signin
                  ? const SizedBox()
                  : FadeTransition(
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
            ],
          ),
        ),
        const SizedBox(
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
                  child: const Text(continueText),
                  style: ElevatedButton.styleFrom(
                    primary: orange,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(extraLargeBorderRadius),
                    ),
                  ),
                ),
              ),
        const SizedBox(
          height: 4,
        ),
        TextButton(
          onPressed: _switchAuthMode,
          child: Text(_authMode == AuthMode.Signin ? signUp : logIn),
        ),
      ],
    );
  }
}
