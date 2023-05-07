class MenuItem {
  MenuItem({
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String icon;
  final Function()? onTap;
}
