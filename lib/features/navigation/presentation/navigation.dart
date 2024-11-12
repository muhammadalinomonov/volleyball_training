import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:volleyball_training/features/main/presentation/main_screen.dart';
import 'package:volleyball_training/features/navigation/presentation/home.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final NavItemEnum tabItem;

  const TabNavigator({required this.tabItem, required this.navigatorKey, super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> with AutomaticKeepAliveClientMixin {
  Map<String, WidgetBuilder> _routeBuilders({required BuildContext context, required RouteSettings routeSettings}) {
    switch (widget.tabItem) {
      case NavItemEnum.main:
        return {
          TabNavigatorRoutes.root: (context) => const CupertinoScaffold(body: MainScreen()),
        };
      case NavItemEnum.activities:
        return {
          TabNavigatorRoutes.root: (context) => const Placeholder(),
        };
      case NavItemEnum.profile:
        return {
          TabNavigatorRoutes.root: (context) => const Placeholder()
        };
      default:
        return {TabNavigatorRoutes.root: (context) => const SizedBox()};
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: widget.navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        final routeBuilders = _routeBuilders(context: context, routeSettings: routeSettings);
        return CupertinoPageRoute(
          builder: (context) =>
          routeBuilders.containsKey(routeSettings.name) ? routeBuilders[routeSettings.name]!(context) : Container(),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

PageRouteBuilder fade({required Widget page, RouteSettings? settings}) => PageRouteBuilder(
  transitionDuration: const Duration(milliseconds: 200),
  transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
    opacity: CurvedAnimation(
      curve: const Interval(0, 1, curve: Curves.linear),
      parent: animation,
    ),
    child: child,
  ),
  settings: settings,
  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
);

