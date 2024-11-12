import 'dart:async';
import 'dart:io';


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'authentication_event.dart';
part 'authentication_state.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  // final GetUserUseCase _getUserDataUseCase = GetUserUseCase(repository: serviceLocator.call());
  // final GetOneIdUrlUseCase _getOnIDUrlUseCase = GetOneIdUrlUseCase(repository: serviceLocator.call());
  //
  // final CreateTokenUseCase _createTokenUseCase = CreateTokenUseCase(repository: serviceLocator());
  // final ValidateUserUseCase _validateUserUseCase = ValidateUserUseCase(repository: serviceLocator.call());
  // final GetAuthenticationStatusUseCase _authStatusStreamUseCase =
  //     GetAuthenticationStatusUseCase(repository: serviceLocator.call());
  // late StreamSubscription<AuthenticationStatus> _authSubscription;

  AuthenticationBloc() : super(AuthenticationState.unauthenticated()) {


    on<InitializeAuthStreamSubscription>((event, emit) async {
      // _authSubscription = _authStatusStreamUseCase.call(NoParams()).listen((event) {
      //   add(AuthenticationStatusChanged(status: event, withDelay: true));
      // });
    });
    on<AuthenticationStatusChanged>((event, emit) async {
      // print('status changed: ${event.status} ${DateTime.now().toString()}');
      // switch (event.status) {
      //   case AuthenticationStatus.authenticated:
      //     final resultF = _getUserDataUseCase.call(NoParams());
      //     final delay = Future.delayed(Duration(seconds: event.withDelay ? 0 : 0));
      //     final result = await Future.wait([resultF, delay]);
      //     if (result.first.isRight) {
      //       await StorageRepository.putBool(key: StoreKeys.isAuthenticated, value: true);
      //
      //       print('time0: 1${DateTime.now().toString()}');
      //       if (event.withDelay) {
      //         print('time0: 2${DateTime.now().toString()}');
      //       }
      //       print('time0: 3${DateTime.now().toString()}');
      //       emit(AuthenticationState.authenticated(userEntity: result.first.right));
      //     } else {
      //       await StorageRepository.putBool(key: StoreKeys.isAuthenticated, value: false);
      //       // await StorageRepository.deleteString(StoreKeys.token);
      //       // await StorageRepository.deleteString(StoreKeys.refresh);
      //       print('time0: 1${DateTime.now().toString()}');
      //       // if(event.withDelay) {
      //       //   await Future.delayed(const Duration(seconds: 5));
      //       //   print('time0: 2${DateTime.now().toString()}');
      //       // }
      //       print('time0: 2${DateTime.now().toString()}');
      //       emit(AuthenticationState.unauthenticated(url: state.url));
      //     }
      //     break;
      //   case AuthenticationStatus.unauthenticated:
      //     if (event.withDelay) {
      //       await Future.delayed(const Duration(seconds: 5));
      //     }
      //     await StorageRepository.putBool(key: StoreKeys.isAuthenticated, value: false);
      //     await StorageRepository.deleteString(StoreKeys.token);
      //     await StorageRepository.deleteString(StoreKeys.refresh);
      //     add(GetOneIDUrlEvent());
      //     // emit(AuthenticationState.unauthenticated(url: state.url));
      //     break;
      // }
    });

    on<GetOneIDUrlEvent>((event, emit) async {
      // final res = await _getOnIDUrlUseCase.call(NoParams());
      // if (res.isRight && res.right.isNotEmpty) {
      //   final newState = AuthenticationState.getUrl(url: res.right);
      //   print('time1: ${DateTime.now().toString()}');
      //   emit(AuthenticationState.unauthenticated(url: res.right));
      // }
    });

    on<CreateTokenEvent>((event, emit) async {
      // final result = await _createTokenUseCase.call(CreateTokenUseCaseParams(
      //     token: event.token, deviceName: 'deviceName' ?? '', isIos: true, deviceUniqueName: 'deviceUniqueName' ?? ''));
      //
      //
      //
      // if (result.isRight) {
      //   ///for validation
      //   /// event.onCreteToken.call(result.right);
      //   /// if(!result.right){
      //   ///   return;
      //   /// }
      //   final userData = await _getUserDataUseCase.call(NoParams());
      //
      //   if (userData.isRight) {
      //       emit(AuthenticationState.authenticated(userEntity: userData.right));
      //   } else {
      //     emit(AuthenticationState.unauthenticated());
      //   }
      // } else {
      //   emit(AuthenticationState.unauthenticated());
      // }
    });

    on<ValidateUserEvent>((event, emit) async {
      // final result = await _validateUserUseCase.call(event.token);
      // if (result.isRight) {
      //   final userData = await _getUserDataUseCase.call(NoParams());
      //   if (userData.isRight) {
      //     if (userData.right.isValidated) {
      //       emit(AuthenticationState.authenticated(userEntity: userData.right));
      //     }
      //     event.onSuccess.call();
      //   } else {
      //     emit(AuthenticationState.unauthenticated());
      //   }
      // } else {
      //   emit(AuthenticationState.unauthenticated());
      // }
    });
  }

  Future<String?> getDeviceModel() async {
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //
    // if (Platform.isAndroid) {
    //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    //   return androidInfo.model; // This might return "Galaxy A25" for Samsung devices.
    // } else if (Platform.isIOS) {
    //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    //   return iosInfo.utsname.machine; // This returns the internal model code like "iPhone15,2" for iPhone 14 Pro.
    // }
    //
    // return null;
  }

  @override
  Future<void> close() {
    // _authSubscription.cancel();
    return super.close();
  }
}
