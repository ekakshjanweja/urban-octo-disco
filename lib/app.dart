import 'package:domi_labs_test/screens/home.dart';
import 'package:flutter/material.dart';

class DomiLabsTest extends StatelessWidget {
  const DomiLabsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DomiLabs Test',
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const Home(),
    );
  }
}
