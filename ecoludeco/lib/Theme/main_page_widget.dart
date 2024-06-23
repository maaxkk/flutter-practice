import 'package:ecoludeco/menu_list/menu_list_widget.dart';
import 'package:flutter/material.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  int _selectedTab = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    MenuListWidget(),
    Text('Blog'),
    Text('Profile'),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ecoludeco',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // body: Center(child: _widgetOptions[_selectedTab]),
      body: Center(
        child: IndexedStack(
          children: _widgetOptions,
          index: _selectedTab,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Blog'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
