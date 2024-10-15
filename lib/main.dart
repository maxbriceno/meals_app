import 'package:flutter/material.dart';
import 'package:meals_app/const/themes/theme.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kTheme,
      home: const TabsScreen(),
    );
  }
}
