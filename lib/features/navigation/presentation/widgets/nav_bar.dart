import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volleyball_training/assets/colors.dart';
import 'package:volleyball_training/features/navigation/domain/entities/navbar.dart';

class NavItemWidget extends StatelessWidget {
  final int currentIndex;
  final NavBar navBar;

  const NavItemWidget({
    required this.navBar,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          currentIndex == navBar.id
              ? navBar.activeIcon.isNotEmpty
                  ? navBar.activeIcon
                  : navBar.icon
              : navBar.icon,
          colorFilter: ColorFilter.mode(
            (currentIndex == navBar.id
                    ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                    : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor) ??
                mainColor,
            BlendMode.srcIn,
          ),
          height: 24,
          width: 24,
        ),
        const SizedBox(height: 6),
        Text(
          navBar.title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: currentIndex == navBar.id
              ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle
              : Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
