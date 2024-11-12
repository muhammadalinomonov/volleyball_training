import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:volleyball_training/assets/theme.dart';
import 'package:volleyball_training/core/singeltons/service_locator.dart';
import 'package:volleyball_training/features/auth/presentation/blocs/auth_bloc/authentication_bloc.dart';
import 'package:volleyball_training/features/auth/presentation/screens/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NavigatorState get navigator => MyApp.navigatorKey.currentState!;
  final _navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => LocaleBloc()),
        BlocProvider(create: (context) => AuthenticationBloc()),

      ],
      child: MaterialApp(
        title: 'Volleyball training',
        navigatorKey: MyApp.navigatorKey,
        debugShowCheckedModeBanner: false,

        locale: Locale('uz'),
        navigatorObservers: [
          // SentryNavigatorObserver(),
        ],
        theme:  AppTheme.theme(),

        // builder: (context, child) {
        //   return BlocListener<AuthenticationBloc, AuthenticationState>(
        //     // listenWhen: (previous, current) => previous.status != current.status,
        //     listener: (context, state) {
        //       print('AuthenticationBloc state: ${state.status}');
        //       switch (state.status) {
        //         case AuthenticationStatus.unauthenticated:
        //           final isFirst = StorageRepository.getBool(StoreKeys.isFirstTime, defValue: true);
        //           if (isFirst) {
        //             navigator.pushAndRemoveUntil(MaterialWithModalsPageRoute(builder: (BuildContext context) {
        //               return const Placeholder();
        //             }), (route) => false);
        //           } else {
        //             navigator.pushAndRemoveUntil(MaterialWithModalsPageRoute(builder: (BuildContext context) {
        //               return const Placeholder();
        //             }), (route) => false);
        //           }
        //           break;
        //         case AuthenticationStatus.authenticated:
        //           navigator.pushAndRemoveUntil(MaterialWithModalsPageRoute(builder: (BuildContext context) {
        //             return const Placeholder();
        //           }), (route) => false);
        //           break;
        //       }
        //     },
        //   );
        //
        // },
        home: const SplashPage(),
        onGenerateRoute: (_) => MaterialWithModalsPageRoute(
            builder: (_) =>
            const MediaQuery(data: MediaQueryData(textScaler: TextScaler.linear(1.0)), child: SplashPage())),
      ),
    );
  }
}