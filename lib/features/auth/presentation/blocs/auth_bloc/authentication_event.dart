part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationStatus status;
  final bool withDelay;

  AuthenticationStatusChanged({required this.status, this.withDelay = false});
}

class GetOneIDUrlEvent extends AuthenticationEvent {}

class CreateTokenEvent extends AuthenticationEvent {
  final String token;
  // final Function(bool isValidate) onCreteToken;

  CreateTokenEvent({required this.token, /*required this.onCreteToken*/});
}

class InitializeAuthStreamSubscription extends AuthenticationEvent {
  InitializeAuthStreamSubscription();
}

class ValidateUserEvent extends AuthenticationEvent{
  final String token;
  final VoidCallback onSuccess;

  ValidateUserEvent({required this.token, required this.onSuccess});
}