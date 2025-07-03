import 'package:flutter/material.dart';
import 'package:where_toilet/toilet_list/toilet_list_screen.dart';
import 'package:where_toilet/toilet_list/toilet_fav_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 40, color: Colors.amber),
        ),
      ),
      home: MyHomePage(),
      /*
      routes: {
        '/': (context) => ServicesScreen(),
      },
      onGenerateRoute: (settings){
        Widget content = const SizedBox();

        switch(settings.name){
          case ScreenC.routeName:
            final arguments = settings.arguments;
            if(arguments is String) {
              content = ScreenC(id: arguments);
            }
            break;
        }

        return MaterialPageRoute(
          builder: (context) => content,
          settings: settings,
        );
      },*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    ServicesScreen(),
    FavoriteToiletListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Toilettes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
        ],
      ),
    );
  }
}
