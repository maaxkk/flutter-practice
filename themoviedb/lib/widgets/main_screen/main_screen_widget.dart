import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/Theme/app_colors.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static final List<Widget> _widgetOptions = <Widget> [
    Text('News'),
    MovieListWidget(),
    Text('Series'),
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
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'TMDB',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      // body: Center(child: _widgetOptions[_selectedTab]),
      body: IndexedStack(
        index: _selectedTab,
        children: _widgetOptions
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Series',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
