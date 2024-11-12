import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volleyball_training/assets/colors.dart';

abstract class AppTheme {
  static ThemeData theme() => ThemeData(
      scaffoldBackgroundColor: scaffoldColorLight,
      fontFamily: 'Inter',
      primaryColor: mainBlue2,
      hintColor: graySuit,
      disabledColor: lavender,
      hoverColor: graySuit,
      focusColor: borderColor,
      canvasColor: graySuit,
      unselectedWidgetColor: pattensBlue2,
      cardColor: borderColor.withOpacity(.5),
      secondaryHeaderColor: mainColor,
      indicatorColor: red,
      splashColor: red,
      highlightColor: pattensBlue2,
      primaryColorLight: white,
      primaryColorDark: dark,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: mainColor,
        circularTrackColor: mainColor,
        linearTrackColor: mainColor,
        refreshBackgroundColor: mainColor,
      ),
      shadowColor: buttonColor.withOpacity(0.36),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent, modalBackgroundColor: white),
      iconTheme: const IconThemeData(color: dark),
      dividerTheme: const DividerThemeData(color: primaryLight),
      toggleButtonsTheme: const ToggleButtonsThemeData(focusColor: mainColor),
      navigationBarTheme: const NavigationBarThemeData(backgroundColor: white),
      // bottom all used
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: white,
          selectedItemColor: navBarIconActiveColor,
          unselectedItemColor: navBarIconNoActiveColor,
          selectedLabelStyle: TextStyle(
            color: navBarTextActiveColor,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            color: blackRussiann,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          selectedIconTheme: IconThemeData(color: white),
          unselectedIconTheme: IconThemeData(color: grey)),
      dividerColor: borderColor,
      bannerTheme: const MaterialBannerThemeData(backgroundColor: grey),
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: const IconThemeData(color: blackRussiann),
        titleTextStyle: displayMedium.copyWith(color: darkTextColor),
        centerTitle: true,
        backgroundColor: white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Platform.isIOS ? scaffoldColor : Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: white,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelStyle: headlineLarge.copyWith(fontWeight: FontWeight.w700),
        labelPadding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: mainColor,
        unselectedLabelStyle: headlineLarge.copyWith(fontWeight: FontWeight.w400),
        unselectedLabelColor: mainBlue2,
        labelColor: dark,
        dividerColor: borderColor.withOpacity(.1),
        dividerHeight: 2,
        indicator: const UnderlineTabIndicator(borderSide: BorderSide(color: mainColor, width: 2)),
      ),
      radioTheme: const RadioThemeData(
          visualDensity: VisualDensity.compact, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
      sliderTheme: SliderThemeData(
          valueIndicatorColor: grey,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
          overlayShape: SliderComponentShape.noOverlay),
      listTileTheme: const ListTileThemeData(
          style: ListTileStyle.drawer, textColor: grey, tileColor: listTileColor, iconColor: grey),
      cardTheme: const CardTheme(color: grey, surfaceTintColor: grey),
      popupMenuTheme: const PopupMenuThemeData(color: grey, surfaceTintColor: grey),
      drawerTheme: const DrawerThemeData(backgroundColor: grey, scrimColor: grey),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: floatBackColor),
      textTheme: const TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      ),
      colorScheme: ColorScheme(
        onInverseSurface: quoteColor,
        primaryContainer: white,
        brightness: Brightness.light,
        primary: primaryLight,
        secondary: secondaryLight,
        secondaryContainer: textFieldColor,
        onSecondaryContainer: borderColor,
        error: red,
        surface: listTileColor,
        onPrimary: listTileColor,
        onSecondary: graySuit,
        onError: red,
        onSurface: black,
        onTertiary: quoteColor,
        scrim: kashmirBlue,
        onPrimaryContainer: mainColor.withOpacity(.16),
        outline: madison,
        inversePrimary: aliceBlue,
      ));

  // Fonts
  static const displayLarge = TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: dark, fontFamily: 'Inter');
  static const displayMedium = TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: dark, fontFamily: 'Inter');
  static const displaySmall = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: dark, fontFamily: 'Inter');
  static const headlineLarge = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: dark, fontFamily: 'Inter');
  static const headlineMedium = TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: dark, fontFamily: 'Inter');
  static const headlineSmall = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: dark, fontFamily: 'Inter');
  static const titleLarge = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: dark, fontFamily: 'Inter');
  static const titleMedium = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: dark, fontFamily: 'Inter');
  static const titleSmall = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: dark, fontFamily: 'Inter');
  static const bodyLarge = TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: dark,  fontFamily: 'Inter');
  static const bodyMedium = TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: black,  fontFamily: 'Inter');
  static const bodySmall = TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: dark, fontFamily: 'Inter');
  static const labelLarge = TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: dark, fontFamily: 'Inter');
  static const labelMedium = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: dark, fontFamily: 'Inter');
  static const labelSmall = TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: dark, fontFamily: 'Inter');
}

LinearGradient shimmerFeatureDarkMode =  LinearGradient(
    colors: [const Color(0xff25333F), const Color(0xff25333F).withOpacity(0), const Color(0xff25333F)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);
LinearGradient secondShimmerFeatureDarkMode =  LinearGradient(
    colors: [const Color(0xff2F3F4D), const Color(0xff2F3F4D).withOpacity(0), const Color(0xff2F3F4D)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);

LinearGradient shimmerFeature =  LinearGradient(
    colors: [const Color(0xffF2F4F5),const Color(0xffF2F4F5).withOpacity(.2) , Color(0xffF2F4F5)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);
LinearGradient secondShimmerFeature =  LinearGradient(
    colors: [const Color(0xffE6EAEC),const Color(0xffE6EAEC).withOpacity(.2) , Color(0xffE6EAEC)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);


Widget adaptiveAction({required BuildContext context, required VoidCallback onPressed, required Widget child}) {
  final ThemeData theme = Theme.of(context);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return TextButton(onPressed: onPressed, child: child);
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return CupertinoDialogAction(onPressed: onPressed, child: child);
  }
}
