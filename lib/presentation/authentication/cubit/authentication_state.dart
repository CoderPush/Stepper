part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final String userEmail;
  final String userName;
  const AuthenticatedState({
    required this.userEmail,
    required this.userName,
  });
}

class UnauthenticatedState extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String errorMessage;

  const AuthenticationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
