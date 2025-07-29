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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/home":
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => HomePage(),
              transitionsBuilder: (_, animation, __, child) {
                // Fade in
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: Duration(milliseconds: 400),
            );

          case "/search":
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => Search(),
              transitionsBuilder: (_, animation, __, child) {
                // Slide from right
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              transitionDuration: Duration(milliseconds: 500),
            );

          case "/addOrUpdate":
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => AddOrUpdatePage(),
              transitionsBuilder: (_, animation, __, child) {
                // Scale in
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
                  child: child,
                );
              },
              transitionDuration: Duration(milliseconds: 400),
            );

          case "/detail":
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => Detail(),
              transitionsBuilder: (_, animation, __, child) {
                // Rotation + Fade
                return RotationTransition(
                  turns: Tween(begin: 0.75, end: 1.0).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              transitionDuration: Duration(milliseconds: 600),
            );

          default:
            return null;
        }
      },
    );
  }
}
