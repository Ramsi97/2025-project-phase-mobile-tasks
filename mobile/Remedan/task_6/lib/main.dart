import 'package:flutter/material.dart';
import 'package:task_6/add_or_update_page.dart';
import 'package:task_6/detail.dart';
import 'package:task_6/search.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(
              Color.fromRGBO(63, 81, 243, 1),
            ), // Icon color
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",

      routes: {
        "/home": (context) => HomePage(),
        "/search": (context) => Search(),
        "/addOrUpdate": (context) => AddOrUpdatePage(),
        "/detail": (context) => Detail(),
      },
    );
  }
}
