import 'package:definitive_flutter/application/pages_app/calendar_page.dart';
import 'package:definitive_flutter/application/pages_app/explore_page.dart';
import 'package:definitive_flutter/application/pages_app/info_page.dart';
import 'package:definitive_flutter/application/pages_app/new_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<HomePage> {
  //Variables inside:
  int _currentPageIndex = 0;
  final value = 0;
  //Object for Page index:
  final ExplorePage explorePage = const ExplorePage(title: 'HOME');
  final NewListPage newListPage = const NewListPage(title: 'CREATE PAGE');
  final CalendarPage calendarPage = const CalendarPage(title: 'CALENDAR');
  final InfoPage infoPage = InfoPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EXPENSE'),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'New List',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          NavigationDestination(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
      body: <Widget>[
        explorePage,
        newListPage,
        calendarPage,
        infoPage.build(context),
      ][_currentPageIndex],
    );
  }
}
