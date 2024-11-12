part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  // final UserEntity user;
  final AuthenticationStatus status;
  final String url;

  const AuthenticationState._({
    required this.status,
    // required this.user,
    this.url = '',
  });

  AuthenticationState.getUrl({required String url})
      : this._(
          status: AuthenticationStatus.unauthenticated,
          // user: UserModel.fromJson(const {}),
          url: url,
        );

  const AuthenticationState.authenticated({/*required UserEntity userEntity,*/ String? url})
      : this._(
          status: AuthenticationStatus.authenticated,
          // user: userEntity,
          url: url ?? '',
        );

  AuthenticationState.unauthenticated({String? url})
      : this._(
          status: AuthenticationStatus.unauthenticated,
          // user: UserModel.fromJson(const {}),
          url: url ?? '',
        );

  @override
  List<Object?> get props => [status,/* user,*/ url];
}
