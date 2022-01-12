import 'package:flutter/material.dart';

class NavigationItem {
  final IconData icon;
  final String label;
  final String route;

  const NavigationItem({
    required this.route,
    required this.label,
    required this.icon,
  });
}

final List<NavigationItem> items = [
  const NavigationItem(
    icon: Icons.home,
    label: 'Home',
    route: '/',
  ),
  const NavigationItem(
    icon: Icons.search,
    label: 'Search',
    route: '/search',
  )
];

class DefaultNavigationBar extends StatefulWidget {
  const DefaultNavigationBar({Key? key}) : super(key: key);

  @override
  _DefaultNavigationBarState createState() => _DefaultNavigationBarState();
}

class _DefaultNavigationBarState extends State<DefaultNavigationBar> {
  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;
    int currentIndex = 0;

    for (int index = 0; index < items.length; index++) {
      if (items[index].route == currentRoute) currentIndex = index;
    }

    void changeRoute(int index) {
      String nextRoute = items[index].route;
      if (currentRoute != nextRoute) {
        Navigator.pushNamed(context, nextRoute);
      }

      setState(() {
        currentIndex = index;
      });
    }

    return BottomNavigationBar(
      items: items.map((e) {
        return BottomNavigationBarItem(
          icon: Icon(e.icon),
          label: e.label,
        );
      }).toList(),
      currentIndex: currentIndex,
      onTap: changeRoute,
    );
  }
}
