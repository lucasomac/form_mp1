import 'package:flutter/material.dart';
import 'package:form_mp1/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            foregroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.blueAccent,
            ),
          ),
        ),
      ),
      home: Home(
        title: 'Exercício Montagem GUI',
      ),
    );
  }
}
