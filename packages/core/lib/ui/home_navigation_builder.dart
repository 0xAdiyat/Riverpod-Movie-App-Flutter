import 'package:flutter/material.dart';

enum TabItem { nowPlaying, favourites, profiles }

class HomeNavigationBuilder extends StatefulWidget {
  const HomeNavigationBuilder({super.key, required this.builder});

  final Widget Function(BuildContext, TabItem) builder;

  @override
  State<HomeNavigationBuilder> createState() => _HomeNavigationBuilderState();
}

class _HomeNavigationBuilderState extends State<HomeNavigationBuilder> {
  TabItem _currentTab = TabItem.nowPlaying;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.builder(context, _currentTab),
      bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: (tab) => setState(() => _currentTab = tab)),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key, required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab.index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Now Playing',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favourites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profiles',
        ),
      ],
      onTap: (index) => onSelectTab(TabItem.values[index]),
    );
  }
}
