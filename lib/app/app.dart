import 'package:flutter/material.dart';
import 'package:weather/app/views/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xff2F54AA);
    const textColor = Color(0xFF4A4A4A);
    const backGroundColor = Color(0xFFF5F5F5);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wheather app',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          scaffoldBackgroundColor: backGroundColor,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Poppins',
                bodyColor: textColor,
                displayColor: textColor,
              ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 54),
            ),
          ),
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: primary)),
      home: const MyHomePage(title: 'Wheather app'),
    );
  }
}
