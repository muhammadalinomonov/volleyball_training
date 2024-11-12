import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


extension StringExtensions on String {
  // topSnackBar(BuildContext context, {bool? isError, bool? isSuccess}) {
  //   showTopSnackBar(
  //     Overlay.of(context),
  //     AlertSnackBar(title: this, isError: isError ?? false, isSuccess: isSuccess ?? false),
  //   );
  // }

  double toDouble() {
    if (this != '') {
      return double.tryParse(this) ?? 0;
    } else {
      return 0;
    }
  }

  int toInt() {
    if (this != '') {
      return int.tryParse(substring(indexOf('.'), length - 1)) ?? 0;
    } else {
      return 0;
    }
  }

  String getStatus() {
    switch (this) {
      case "canceled":
        return "Bekor qilindi";
      case "pending":
        return "Kutilmoqda";
      case "created":
        return "Qabul qilindi";
      case "preparing":
        return "Tayyorlanmoqda";
      case "delivering":
        return "Yetkazilmoqda";
      case "delivered":
        return "Yetkazib berildi";
      default:
        return "Aniqlanmagan tur";
    }
  }
}

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  // context.theme.extension<CustomColors>()

  // CustomColors get extension => theme.extension<CustomColors>()!;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  Size get size => MediaQuery.sizeOf(this);

  // LocaleEntity get translations => watch<LocaleBloc>().state.translations;
}

extension BrightnessExtensions on Brightness {
  bool get isLight => this == Brightness.light;

  bool get isDark => this == Brightness.dark;
}
