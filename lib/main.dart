import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/theme_changer_provider.dart';
import 'package:flutter_provider/todo/home_screen.dart';
import 'package:flutter_provider/todo/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeChangerProvider()),
      ],
      child: Builder(
        builder: (context) {
          var themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.theme,
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
