class NavBar {
  final int id;
  final String title;
  final String icon;
  final String activeIcon;

  const NavBar({
    required this.title,
    required this.id,
    required this.icon,
    this.activeIcon = '',
  });
}
