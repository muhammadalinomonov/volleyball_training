import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:volleyball_training/assets/colors.dart';
import 'package:volleyball_training/assets/icons.dart';
import 'package:volleyball_training/features/navigation/domain/entities/navbar.dart';
import 'package:volleyball_training/features/navigation/presentation/navigation.dart';
import 'package:volleyball_training/features/navigation/presentation/widgets/nav_bar.dart';

enum NavItemEnum {
  main,
  activities,
  profile,
}

class HomeScreen extends StatefulWidget {
  final int index;

  const HomeScreen({super.key, this.index = 0});

  // static Route route() => MaterialWithModalsPageRoute<void>(builder: (_) => const HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin, WidgetsBindingObserver {
  late final TabController _controller;

  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.main: GlobalKey<NavigatorState>(),
    NavItemEnum.activities: GlobalKey<NavigatorState>(),
    NavItemEnum.profile: GlobalKey<NavigatorState>(),
  };

  List<NavBar> labels = [];

  int _currentIndex = 0;
  DateTime? pauseTime;

  @override
  void initState() {
    super.initState();
    // _notificationConfig();

    WidgetsBinding.instance.addObserver(this);
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(onTabChange);

    if (widget.index != 0) {
      changePage(widget.index);
    }

    setPermissionOnesignal();
  }

  setPermissionOnesignal() {
    /// TODO: need to uncommit when use one signal
    //     // OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) async {
    //     //   print("Accepted permission: $accepted");
    //     //   final status = await OneSignal.shared.getDeviceState();
    //     //   final String? osUserID = status?.userId;
    //     //   log('::::::::::::::================ device id for ONE SIGNAL: $osUserID');
    //     //   await StorageRepository.putString('deviceId', osUserID!);
    //     // });
    //     //
    //     // OneSignal.shared.setNotificationWillShowInForegroundHandler((event) async {
    //     //   final gf = event.notification.interruptionLevel;
    //     //   final gfds = event.notification.title;
    //     //   final wrg = event.notification.body;
    //     //   notificationGlobalController.add(1);
    //     //   print("Notification Forground  one signal triggered: ${event.notification.body}, ${event.notification.title}, }");
    //     // });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void onTabChange() => setState(() => _currentIndex = _controller.index);

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );

  void changePage(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    labels = [
       NavBar(title: "Asosiy", id: 0, icon: AppIcons.home),
       NavBar(title: 'Mashqlar', id: 1, icon: AppIcons.activities),
       NavBar(title: "Profil", id: 3, icon: AppIcons.profile),
    ];

    return HomeTabControllerProvider(
      controller: _controller,
      child: WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
          !await _navigatorKeys[NavItemEnum.values[_currentIndex]]!.currentState!.maybePop();
          if (isFirstRouteInCurrentTab) {
            if (NavItemEnum.values[_currentIndex] != NavItemEnum.main) {
              changePage(0);
              return false;
            }
          }
          return isFirstRouteInCurrentTab;
        },
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          ),
          child: Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowColor1.withOpacity(0.16),
                    offset: const Offset(0, 4),
                    blurRadius: 32,
                    spreadRadius: 0,
                  ),
                ],
                color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// if podcast is played

                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 28,
                          spreadRadius: 0,
                          offset: const Offset(0, 0),
                          color: mainColor.withOpacity(0.02),
                        ),
                      ],
                      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        labels.length,
                            (index) => Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              changePage(index);
                              _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                                  .currentState
                                  ?.popUntil((route) => route.isFirst);
                            },
                            child: NavItemWidget(
                              navBar: labels[index],
                              currentIndex: _currentIndex,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            resizeToAvoidBottomInset: true,
            body: TabBarView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildPageNavigator(NavItemEnum.main),
                _buildPageNavigator(NavItemEnum.activities),
                _buildPageNavigator(NavItemEnum.profile),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTabControllerProvider extends InheritedWidget {
  final TabController controller;

  const HomeTabControllerProvider({
    super.key,
    required super.child,
    required this.controller,
  });

  static HomeTabControllerProvider of(BuildContext context) {
    final HomeTabControllerProvider? result = context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>();
    assert(result != null, 'No HomeTabControllerProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;
}
