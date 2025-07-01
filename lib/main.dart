import 'package:flutter/material.dart';
import 'package:where_toilet/web_services/web_services_screen.dart';

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
            bodyMedium: TextStyle(
                fontSize: 40,
                color: Colors.amber
            ),
          )
      ),
      routes: {
        '/': (context) => ServicesScreen(),
      }
      /*
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